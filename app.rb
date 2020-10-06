require_relative 'config/environment'

class App < Sinatra::Base
  
  #reverse a given string
  get '/reversename/:name' do
    @reverse = params[:name]
    "#{@reverse.reverse}" 
  end

  #square a given number
  get '/square/:number' do
    @squared = params[:number].to_i ** 2
    "#{@squared}"
  end

  #repeat a given phrase a given number of times
  get '/say/:number/:phrase' do
    result = " "
    params[:number].to_i.times do
      result += params[:phrase]
    end 
    result
  end

  #Join 5 given words
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @string = [params[:word1], params[:word2], params[:word3], params[:word4], params[:word5]]
    "#{@string.join(" ")}."
  end

  #return the desired result of two given numbers
  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    if @operation == "add"
      add = params[:number1].to_i + params[:number2].to_i
      "#{add}"
    elsif @operation == "subtract"
      subtract = params[:number1].to_i - params[:number2].to_i
      "#{subtract}"
    elsif @operation == "multiply"
      multiply = params[:number1].to_i * params[:number2].to_i 
      "#{multiply}"
    elsif @operation == "divide"
      divide = params[:number1].to_i / params[:number2].to_i
      "#{divide}"
    else
      "Sorry this app only operates addition, subtraction, multiplication, and division."
    end
  end

end