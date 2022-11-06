class ProgressesController < ApplicationController

  def new
    @progress = Progress.new
    #@question = Question.first #ここでは質問データを1件取得しています。
    current_game = Game.find(params[:game_id])
    @question = Question.next_question(current_game)
  end

  def create
    current_game = Game.find(params[:game_id])

    #回答した内容を保存する
    progress = current_game.progresses.new(create_params)
    progress.assign_sequence
    progress.save!

#次の質問がなければ(すべての質問を出題したら)、ギブアップとします。
#.blank?は空であるかを判定します。
#「次の質問が空である」=「すべての質問を出題した」と位置づけてます。
#このif文の中にギブアップ時の処理を書きます。
    next_question = Question.next_question(current_game)
    if next_question.blank?
#・statusを'finished'(終了)。
#・resultを'incorrect'(不正解)。
      current_game.status = "finished"
      current_game.result = "incorrect"
      current_game.save!
#そのあとギブアップ画面へリダイレクトします。returnを呼び出すことでコントローラーの処理を終了させます。
      redirect_to give_up_game_path(current_game)
      return
    end

    redirect_to new_game_progresses_path(current_game)
  end

  private

  def create_params
    params.require(:progress).permit(:question_id, :answer)
  end
end
