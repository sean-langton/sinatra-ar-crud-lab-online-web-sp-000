
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
    @articles = Article.all
    redirect to "/articles/#{Article.last.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.title = "fuck you"
    article.content = "and you too"
    redirect to "/articles/#{@article.id}"
  end

end
