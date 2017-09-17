class FiguresController < ApplicationController
  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      if !!Title.find_by(params[:title])
        @figure.titles << Title.find_by(params[:title])
      else
        @figure.titles << Title.create(params[:title])
      end
    end
    if !params[:landmark][:name].empty?
      if !!Landmark.find_by(params[:landmark])
        @figure.landmarks << Landmark.find_by(params[:landmark])
      else
        @figure.landmarks << Landmark.create(params[:landmark])
      end
    end

    erb :'figures/index'
  end

end
