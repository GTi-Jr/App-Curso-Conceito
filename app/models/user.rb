class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, presence: true
	validates :birthday, presence: true

end
