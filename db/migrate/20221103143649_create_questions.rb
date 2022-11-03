class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|

      t.string :content #画面に表示する質問文
      t.string :algorithm #絞り込みアルゴリズムで使用
      t.string :eval_value #絞り込みアルゴリズムで使用

      t.timestamps
    end
  end
end
