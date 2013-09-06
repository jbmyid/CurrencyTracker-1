class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_and_belongs_to_many :countries

  def collect_currencies(currency_codes)
  	new_countrie = Currency.where("code in (?)", currency_codes).includes(:country).map{|currency| currency.country}
    new_countrie.each do |c|
      self.countries << c  
    end
  end

  def visit_countries(country_codes)
    Country.where("code in (?)", country_codes).each do |c|
      self.countries << c
    end
  end
end
