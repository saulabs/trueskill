trueskill
=========

trueskill is a rating-system for games with an arbitrary number of teams and players developed by Microsoft Research. It is based on the Glicko rating system and solves some major flaws of the ELO system.

Usage
-----

Example:
    
    require 'rubygems'
    require 'saulabs/trueskill'
    
    include Saulabs::TrueSkill
    
    # team 1 has just one player with a mean skill of 27.1, a skill-deviation of 2.13
    # and an play activity of 100 %
    team1 = [Rating.new(27.1, 2.13, 1.0)]
    
    # team 2 has two players
    team2 = [Rating.new(22.0, 0.98, 0.8), Rating.new(31.1, 5.33, 0.9)]
    
    # team 1 finished first and team 2 second
    graph = FactorGraph.new([team1, team2], [1,2])
    
    # update the Ratings
    graph.update_skills

Installation
------------

To install the TrueSkill gem, simply run

    [sudo] gem install trueskill

Add the following to your script:
   
    require 'saulabs/trueskill'

Known issues
------------

* The calculation of the ranking probability is not yet implemented

Plans
-----

* 

Note on Patches/Pull Requests
-----------------------------
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

© 2010 Lars Kuhnt (<http://saulabs.net>). 

See LICENSE for details.
