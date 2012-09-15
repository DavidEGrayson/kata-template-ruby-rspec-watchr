require_relative 'kata'

describe Tennis::Game do
  let(:game){ Tennis::Game.new }
  
  it "should keep track of scores" do
    game.scores = [4,5]
    game.scores.should == [4,5]
  end

  it "should have scores of 0,0 by default" do
    game.scores.should == [0,0]
  end
  
  def score_call(*scores)
    game = Tennis::Game.new
    game.scores = scores
    game.score_call
  end

  it "should call ties" do
    score_call(0,0).should == "love-all"
    score_call(1,1).should == "15-all"
    score_call(2,2).should == "30-all"
    (3..10).each do |score|
      score_call(score,score).should == "deuce"
    end

  end

  it "should call scores where both scores are less than 4" do
    score_call(0,1).should == "love-15"
    score_call(1,0).should == "15-love"
    score_call(2,3).should == "30-40"
  end

  it "calls advantages" do
    (4..10).each do |score|
      score_call(score, score-1).should == "advantage 0"
      score_call(score-1, score).should == "advantage 1"
    end
  end

  it "calls games" do
    score_call(0,4).should == "game"
    score_call(1,4).should == "game"
    score_call(4,0).should == "game"
    score_call(4,1).should == "game"
    score_call(7,1).should == "game"

    (4..10).each do |score|
      score_call(score, score-2).should == "game"
      score_call(score-2, score).should == "game"
    end
  end

  def winner(*scores)
    game = Tennis::Game.new
    game.scores = scores
    game.winner
  end

  it "reports the winner" do
    winner(0,0).should == nil
    winner(1,2).should == nil
    winner(0,4).should == 1
    winner(4,0).should == 0
    winner(7,5).should == 0
    winner(80, 80).should == nil
  end
end
