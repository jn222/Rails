require 'sinatra'
require 'sinatra/reloader'

	number = rand(100)

	def checkGuess(guess, number)
		difference = guess - number
		if difference < -5
			"Way too low!"
		elsif difference < 0
			"Too low!"
		elsif difference == 0
			"You got it!"
		elsif difference > 0
			"Too high!"
		elsif difference > 5
			"Way too high!"
		end
	end

get '/' do
	guess = params['guess'].to_i
	guess = nil if guess.to_s != params['guess']
	response = checkGuess(guess, number) unless guess.nil?
	erb :index, :locals => {:number => number, :response => response}
end