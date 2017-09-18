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

    redirect :"/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
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

    redirect :"/figures/#{@figure.id}"
  end
end
