class MoviesController < ApplicationController
  
  def index
    @movies = Movie.order(created_at: :desc)
  end

  
  
  def new
    @movie = Movie.new # フォーム用の空のインスタンスを生成する。
  end

  def create
    @movie = Movie.new(movie_params) # ストロングパラメータを引数に
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
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie, notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "投稿を削除しました。"
  end

  private

  def movie_params # ストロングパラメータを定義する
    params.require(:movie).permit(:title)
  end
end
