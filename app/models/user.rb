class User < ActiveRecord::Base
    has_many :reviews
    has_secure_password
    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: {minimum: 8}

    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email)
        if user && user.authenticate(password)
            return user
        else 
            return nil
        end    
    end

end
