class User < ApplicationRecord
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password_digest
  has_many :measurements, dependent: :destroy
end
