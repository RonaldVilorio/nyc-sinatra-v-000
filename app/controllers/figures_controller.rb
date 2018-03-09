class FiguresController < ApplicationController

  get '/figures/new' do
    @figures = Figure.all
    erb :'/figures/new'
  end
  post '/figures' do
    binding.pry
    @figure = Figure.create(name: params[:figure_name])

    @figure.titles << Title.find_or_create_by(name: params[:new_title]) if !params[:new_title].empty?
    @figure.title_ids = params[:figure][:title_ids]

    @figure.landmark_ids = params[:figure][:landmark_ids]
    @figure.landmarks << Landmark.find_or_create_by(name: params[:new_landmark])
    @figure.save







  end


end
