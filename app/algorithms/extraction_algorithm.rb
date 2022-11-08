class ExtractionAlgorithm
  attr_reader :game
  attr_reader :query

  def initialize(game)
    @game = game
    @query = Comic.all
  end
  
  def compute
    progresses = @game.progresses
    progresses.each do |progress|
      # question
      question = progress.question

      # ==========ここから追加する==========
      case question.algorithm
        when 'serialization_end'
          serialization_end?(progress)
        else
          raise Exception('Invalid algorithm. --> ' + question.algorithm.to_s)
      end
      # ==========ここまで追加する==========

      Rails.logger.debug('On the way query is ' + @query.to_sql.to_s)
      Rails.logger.debug('On the way comics are ' + @query.pluck(:title).to_a.to_s)

    end
    @query
  end

  # ==========ここから追加する==========
  private 
  
  def serialization_end?(progress)

    if progress.positive_answer?
      @query = @query.where.not("comics.serialization_end_year is null")
    end

    if progress.negative_answer?
      @query = @query.where("comics.serialization_end_year is null")
    end

  end
  # ==========ここまで追加する==========

end
