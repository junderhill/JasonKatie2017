require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Invite
  include DataMapper::Resource
  property :id,		Serial
  property :code, 	String, :required => true
  property :name,	String, :required => true
  has 1, :rsvp,	:required => false
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

get '/' do
  erb :index
end

post '/rsvp' do
  invite = Invite.first(:code => params[:invitecode])

  erb :response, :locals => {:id => invite.id, :code => invite.code, :name => invite.name}
end
