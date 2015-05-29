require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt
end
