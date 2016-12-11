require 'sinatra'

class RSVP < Sinatra::Base
    get '/' do
          "Hello, world!"
    end
end
