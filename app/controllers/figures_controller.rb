class FiguresController < ApplicationController
set :views, Proc.new { File.join(root, "../views/") }

	get '/figures/:id/edit' do
		@figure = Figure.find(params[:id])
		erb :'figures/edit'
	end

	get '/figures/new' do
		erb :'figures/form'
	end 

	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		erb :'figures/show'
	end

	get '/figures' do
		erb :'figures/index'
	end

	post '/figures/:id' do
		@figure = Figure.find(params[:id])
		@figure.update(params[:figure])
		if !params[:title][:name].empty?
			@title = Title.create(params[:title])
			@figure.titles << @title
		end
		if !params[:landmark][:name].empty?
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end
		@figure.save
		redirect "/figures/#{params[:id]}"
	end
		

	post '/figures' do
		@figure = Figure.create(params[:figure])
		if !params[:title][:name].empty?
			@title = Title.create(params[:title])
			@figure.titles << @title
		end
		if !params[:landmark][:name].empty?
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end
		@figure.save
	end

end
