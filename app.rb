require 'bundler'
Bundler.require


class App < Sinatra::Application

  get '/' do
    erb :index
  end

  post '/result' do
    array = []
    hash = {}
    params.each {|k, v| array << v; hash[v] = 0}
    hash.each do |k, v|
      hash[k] = array.count(k)
    end
    @result = hash.keys[0] if hash.count == 1
    @result ||= winner(hash)
    erb :result
  end

  helpers do
    def winner(hash)
      array = hash.sort
      if array[0][1] == array[1][1]
        return "Rainbow"
      else
        return array[0][0]
      end
    end

  end
 
end



