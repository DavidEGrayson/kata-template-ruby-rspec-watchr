module Tennis
  class Game
    attr_accessor :scores

    def initialize
      @scores = [0, 0]
    end

    def winner
      scores.index(scores.max) if scores.max >= 4 && scores.max >= scores.min + 2
    end

    ScoreName = ["love", "15", "30", "40"]
    
    def score_call
      if winner
        "game"
      elsif scores[0] == scores[1]
        if scores[0] < 3
          ScoreName[scores[0]] + "-all"
        else
          "deuce"
        end
      elsif scores.max < 4
        ScoreName[scores[0]] + "-" + ScoreName[scores[1]]
      elsif scores[0] == scores[1] + 1
        "advantage 0"
      elsif scores[1] == scores[0] + 1
        "advantage 1"
      else
        raise
      end
    end

  end
end
