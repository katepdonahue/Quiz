require 'bundler'
Bundler.require


class App < Sinatra::Application

  get '/' do
    erb :index
  end

  post '/result' do
    array = []
    hash = {}
    params.each {|k, v| array << v}
    array.each do |elt|
      hash[elt] = array.count(elt)
    end
    @result = hash.max_by{|k,v| v}
    erb :result
  end
 
end



