require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: 'creator_id', dependent: :destroy
  has_many :survey_answers

  validates :name, length: { minimum: 3}
  validates :password, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true # Whatever you are using as the unique key needs to be validated as unique when creating objects!

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
