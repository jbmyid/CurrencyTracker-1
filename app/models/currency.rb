class Currency < ActiveRecord::Base
  self.primary_key = :code
  attr_accessible :name, :code, :country_id

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  belongs_to :country

  # Fires mutiple queries
  def self.collected
    all.select {|currency| currency.collected? }
  end

  # Fires mutiple queries
  def self.not_collected
    all.reject {|currency| currency.collected? }
  end

  # Fires mutiple queries
  def collected?
    country.nil? ? false : country.visited?
  end

  def self.collected_by(user)
    joins(:country=>[:countries_users]).where("countries_users.user_id=?", user.id)
  end

  def self.not_collected_by(user)
    where("code NOT IN (?)", collected_by(user).pluck("currencies.code"))
  end

  def collected_by?(user)
    country.nil? ? false : country.visited_by?(user)
  end
end
