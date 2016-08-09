require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  cheat_enabled = cheat_mode(cheat, number)
  message = check_guess(guess, number)
  color = check_color(guess, number)
  erb :index, :locals => {:number => number, :message => message, :cheat_enabled=> cheat_enabled, :color => color}
end

def cheat_mode(cheat, number)
  if cheat == "true"
    "Cheat mode enabled, the secret number is #{number} <br />"
  end
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
    "Your guess was right on! </br> The secret number is #{number}"
  end
end

def check_color(guess, number)
  if guess.to_i - 5 > number
    "red"
  elsif guess.to_i > number
    "yellow"
  elsif guess.to_i + 5 < number
    "red"
  elsif guess.to_i < number
    "yellow"
  else guess.to_i == number
    "green"
  end
end
