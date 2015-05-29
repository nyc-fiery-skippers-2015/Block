require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: 'creator_id'
  has_many :survey_answers
end
