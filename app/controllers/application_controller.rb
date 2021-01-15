
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  get "/articles" do
      @articles = Article.all
      erb :index
    end

    # new
    get "/articles/new" do
      @article = Article.new
      erb :new
    end

    # create
    post "/articles" do
      @article = Article.create(params)
      redirect to "/articles/#{ @article.id }"
    end

end
