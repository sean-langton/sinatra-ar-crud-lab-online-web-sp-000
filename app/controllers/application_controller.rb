
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(title:params[:title], content:params[:content])

    erb :show
  end

  get '/articles/:id' do
    @article = Article.find(:id)
    erb :show
  end

  get '/articles' do

end
