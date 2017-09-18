class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      if !!Figure.find_by(params[:figure])
        @landmark.figure = Figure.find_by(params[:figure])
      else
        @landmark.figure = Figure.create(params[:figure])
      end
    end
    if !params[:title][:name].empty?
      if !!Title.find_by(params[:title])
        @landmark.figure.titles << Title.find_by(params[:title])
      else
        @landmark.figure.titles << Title.create(params[:title])
      end
    end

    redirect :"/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @figure = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    if !params[:figure][:name].empty?
      if !!Figure.find_by(params[:figure])
        @landmark.figure = Figure.find_by(params[:figure])
      else
        @landmark.figure = Figure.create(params[:figure])
      end
    end

    redirect :"/landmarks/#{@landmark.id}"
  end
end
