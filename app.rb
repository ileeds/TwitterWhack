require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require_relative 'TwitterWhacker.rb'
require 'byebug'

get '/' do
	erb :main
end

post '/results' do
	whack=TwitterWhacker.new
	word_one=params[:word_one]
	word_two=params[:word_two]
	@results=whack.word_search(word_one, word_two)
	@index=whack.index
	@score=whack.score(word_one, word_two)
	@example=whack.example
	if @index==0
		@text="You got whacked!"
	elsif @index<5
		@text="Excellent!"
	elsif @index<90
		@text="Pretty good!"
	else
		@text="Try again!"
	end

	erb :results
end
