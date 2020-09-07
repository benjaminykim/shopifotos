class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! }
  validates(:name,
            presence: true,
            length: { maximum: 50 },
           )
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true,
           )
  validates(:password,
            presence: true,
            length: { minimum: 6 },
           )
  has_secure_password


  # return the hash digest of password
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # returns a random token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # returns user in db for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # returns true if given token matches digest
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # remove user cookie
  def forget
    update_attribute(:remember_digest, nil)
  end
end
