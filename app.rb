require 'bundler'
Bundler.require


class App < Sinatra::Application

  get '/' do
    erb :index
  end

  post '/result' do
    erb :result
  end
 
end



