class FiguresController < ApplicationController

  get '/figures/new' do
    @figures = Figure.all
    erb :'/figures/new'
  end
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'

  end
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  # patch
  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    @figure.titles << Title.find_or_create_by(name: params[:title][:name])
    @figure.save
    redirect "figures/#{@figure.id}"
  end
  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.find_or_create_by(name: params[:title][:name]) if !params[:title][:name].empty?
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name],year_completed: params[:landmark][:year_completed]) if !params[:landmark][:name].empty?
    @figure.save
    redirect to "figures/#{@figure.id}"
  end


end
