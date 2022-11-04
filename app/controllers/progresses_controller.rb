class ProgressesController < ApplicationController

  def new
    @progress = Progress.new
    @question = Question.first #ここでは質問データを1件取得しています。
  end

  def create
    current_game = Game.find(params[:game_id])

    #回答した内容を保存する
    progress = current_game.progresses.new(create_params)
    progress.assign_sequence
    progress.save!

    redirect_to new_game_progresses_path(current_game)
  end

  private
  
  def create_params
    params.require(:progress).permit(:question_id, :answer)
  end
end
