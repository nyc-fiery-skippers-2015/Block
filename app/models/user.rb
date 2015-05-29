require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: 'creator_id'
  has_many :survey_answers

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end
end
