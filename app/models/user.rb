class User < ActiveRecord::Base
    has_many :reviews
    has_secure_password
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true

end
