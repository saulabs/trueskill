require "#{File.dirname(__FILE__)}/gauss.rb"

module Saulabs
  
  module TrueSkill
    
    # tau: uncertainty of the skill’s standard deviation TODO: interval???
    # beta: chance factor (low for low-chance games like go and chess) TODO: interval???
    # draw_prob: probalility of a draw game - [0,1(
    # skills: the current skills of the participating players
    # 
    def self.update_skills(tau, beta, draw_prob, skills)
      tau2 = tau**2
      beta2 = beta**2
      num_players = skills.size
      epsilon = -Math.sqrt(2.0 * beta2) * Gauss::Functions.inv_cdf((1.0 - draw_prob) / 2.0)
      factors = []
      variables = []
      
    end
  
  end
  
end
