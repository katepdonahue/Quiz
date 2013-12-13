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
      puts "You answered #{k} #{array.count(k)} times"
    end
    puts hash.count
    puts hash.keys
    @result = hash.keys[0] if hash.count == 1
    puts "result is #{@result}"
    @result ||= hash.max_by{|k,v| v}[0]
    # if hash.max_by{|k,v| v} first two keys are the same, puts rainbow ranger
    puts @result
    erb :result
  end
 
end



