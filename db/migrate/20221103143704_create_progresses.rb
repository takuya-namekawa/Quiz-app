class CreateProgresses < ActiveRecord::Migration[6.1]
  def change
    create_table :progresses do |t|

      t.integer :game_id
      t.integer :sequence #同じゲーム内で1から順番に始まる番号
      t.integer :question_id
      t.string :answer
  #回答で選んだ選択肢。↑
  #登録される文字列パターン : positive / unknown / negative

      t.timestamps
    end
  end
end
