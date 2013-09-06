class Country < ActiveRecord::Base
  self.primary_key = :code
  attr_accessible :name, :code, :visited

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  has_many :currencies
  has_and_belongs_to_many :users
  has_many :countries_users

  accepts_nested_attributes_for :currencies, :allow_destroy => true

  scope :visited, :conditions => { :visited => true }
  scope :not_visited, :conditions => { :visited => false }

  def visited_by?(user)
  	countries_users.map(&:user_id).include?(user.id)
  end

  def self.visited_by(user)
    joins(:countries_users).where("countries_users.user_id=?",user.id)
  end

  def self.not_visited_by(user)
    where("code NOT IN (?)", visited_by(user).pluck("code"))
  end
end
