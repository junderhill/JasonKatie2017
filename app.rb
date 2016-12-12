require 'sinatra'
require 'sinatra/param'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Invite
  include DataMapper::Resource
  property :id,		Serial
  property :code, 	String, :required => true
  property :name,	String, :required => true
  has 1, :rsvp
end

class Rsvp
  include DataMapper::Resource
  property :response,	Boolean,:required => true
  property :dietary,	String
  property :songrequest,String
  property :responded,	DateTime, :default => DateTime.now
  belongs_to :invite, :key => true
end

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
  erb :index, :locals => {:error => ""}
end

post '/rsvp' do
  param :invitecode,	String, required: true, transform: :upcase, format: /[A-Za-z]{5}/

  invite = Invite.first(:code => params[:invitecode])

  error = ""
  if invite == nil
    error = "Your invite code is not valid. Please try again."
    erb :index, :locals => {:error => error}
  else
    erb :response, :locals => {:id => invite.id, :code => invite.code, :name => invite.name, :error => error}
  end
end

post '/rsvpresponse' do
  invite = Invite.first(:code => params[:invitecode])

  response = false
  if params[:response] == "yes"
    response = true
  end

  invite.rsvp = Rsvp.new(:response => response, :dietary => params[:dietaryrequirements], :songrequest => params[:songrequest])

  invite.save

  erb :thanks
end
