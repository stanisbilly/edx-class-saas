class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

	
  def self.winner(player1, player2)
  	valid = /[RPS]/
    raise NoSuchStrategyError.new("Strategy must be one of R,P,S") unless (player1[1] =~ valid) && (player2[1] =~ valid)
  	p1_wins(player1[1],player2[1]) ? player1 : player2
  end

  def self.tournament_winner(tournament)
    return self.winner(tournament[0], tournament[1]) unless tournament[0][0].is_a? Array
    self.winner(tournament_winner(tournament[0]), self.tournament_winner(tournament[1]))
  end
  
  # Helper
	def self.p1_wins(p1, p2)
		return true if (p1 == p2)
		if (p1 == 'R' && p2 == 'S') || (p1 == 'S' && p2 == 'P') || (p1 == 'P' && p2 == 'R')
			return true
		else
			return false
		end
	end
	
end
