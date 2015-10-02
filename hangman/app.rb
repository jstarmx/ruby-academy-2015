require 'sinatra'
require_relative 'lib/game'

class HangmanController < Sinatra::Base
  enable :sessions

  configure do
    set :game, Game.new
  end

  get '/?' do
    erb :index
  end

  get '/play/?' do
    redirect to('/')
  end

  post '/play/' do
    settings.game.play(params['word'])
    erb :play, locals: { game: settings.game, error_message: '' }
  end

  get '/guess/?' do
    redirect to('/')
  end

  post '/guess/' do
    input = params['input']
    error_message = ''

    if settings.game.invalid_guess?(input) || settings.game.repeat_guess?(input)
      if settings.game.invalid_guess?(input)
        error_message = "<strong>#{input}</strong> is not a valid guess. Try again."
      else
        error_message = "You've already guessed <strong>#{input}</strong>!"
      end
    end

    settings.game.guess(input)

    erb :play, locals: { game: settings.game, error_message: error_message }
  end
end

HangmanController.run!
