class Player < ActiveRecord::Base
  has_many :dlf_ranks
  belongs_to :position, foreign_key: :position_id
  has_one :team

  def dlf_last_3_months
    dlf_ranks.order(:month_id => :desc).limit(3)
  end

  def dlf_avg_last_3_months
    ranks = self.dlf_last_3_months
    avg = 0
    ranks.each do |p|
      avg += p.rank
    end
    (avg / 3.0).round(2)
  end

  def dlf_trend_3_months
    ranks = self.dlf_last_3_months
    ranks[2].rank - ranks[0].rank
  end

  def self.dlf_top_trending_players
    players = {}
    self.all.each do |player|



  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def stripped_name
  # Returns a string of the first name and last name combined and
  # with all punctuaion removed to search the DB and account for
  # some variations in spelling
  "#{self.first_name}#{self.last_name}".upcase.gsub(" JR", "")
                                              .gsub(" SR", "")
                                              .gsub(" ", "")
                                              .gsub("-", "")
                                              .gsub(".", "")
                                              .gsub("'", "")
  end

end
