class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [ :show, :edit, :update, :destroy]
  
  def index
    @movies = Movie.order(created_at: :desc)
  end

  def new
    @movie = Movie.new # フォーム用の空のインスタンスを生成する。
  end

  def create
    @movie = current_user.movies.new(movie_params)
    url = params[:movie][:url]
    url = url.last(11)
    @movie.url = url
    #ここまで

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
    if @movie.update(movie_params)
      redirect_to @movie, notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    
    @movie.destroy
    redirect_to movies_path, notice: "投稿を削除しました。"
  end

  private

  def movie_params # ストロングパラメータを定義する
    params.require(:movie).permit(:title)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
