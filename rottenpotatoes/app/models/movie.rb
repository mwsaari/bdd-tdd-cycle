class Movie < ActiveRecord::Base

  attr_accessible :title, :rating, :description, :release_date, :director

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def find_with_same_director
    Movie.all.select{|movie| movie.director == self.director}
  end
end

