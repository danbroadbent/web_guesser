require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess, number)
  if guess.to_i - 5 > number
    "Your guess was way too high..."
  elsif guess.to_i > number
    "Your guess was too high..."
  elsif guess.to_i + 5 < number
    "Your guess was way too low..."
  elsif guess.to_i < number
    "Your guess was too low..."
  else guess.to_i == number
    "Your guess was right on! </br> The secrect number is #{number}"
  end
end
