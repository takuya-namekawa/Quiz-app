class Question < ApplicationRecord
  has_many :progresses

  #メソッドを定義する際、self.next_question(game)という形でselfを付与することでstaticメソッドとなります。
  #staticメソッドはインスタンスを生成せずクラス名.メソッド名という形で呼び出せます。
  #今回作成したメソッドはコントローラーからQuestion.next_question(game)という形で呼び出せるようになります。

  def self.next_question(game)
    answered_question_ids = game.progresses.pluck(:question_id)   #pluckは特定のカラムのみを配列で返却するメソッドです。当該ゲームにて質問・回答したデータのうち質問id(question_id)を返却します。
    Question.where.not(id: answered_question_ids).shuffle.take(1).first
  end

  #questionsテーブルから(※ 1)以外の質問を抽出します。既に出題した質問を再度出題しないため「以外」で絞り込みます。
  #.shuffleは抽出した結果の順番をランダムに入れ替えます。
  #.take(1)は抽出した結果からどれか1件を取得します。
  #.firstは先頭のデータを1件取得します。
  #これらは続けて呼び出すことができ、下記のように1行のプログラムで記載できます。

end
