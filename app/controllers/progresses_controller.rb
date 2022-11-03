class ProgressesController < ApplicationController

  def new
    @progress = Progress.new
    @question = Question.first #ここでは質問データを1件取得しています。
  end
end
