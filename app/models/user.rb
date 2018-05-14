class User < ApplicationRecord
  include Validators

  validates_presence_of :name, :email
  validates :email, email: true
  validates_uniqueness_of :email
end
