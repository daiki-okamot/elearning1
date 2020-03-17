class MoviesController < ApplicationController
  def new
    @movie = Movie.new # フォーム用の空のインスタンスを生成する。
  end

  def create
    @movie = Movie.new(movie_params) # ストロングパラメータを引数に
    @movie.save # saveをしてデータベースに保存する。
    redirect_to @movie # showページにリダイレクト
  end

  private

  def movie_params # ストロングパラメータを定義する
    params.require(:movie).permit(:title)
  end
end
