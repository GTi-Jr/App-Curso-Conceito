class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :subscribed

  def self.from_omniauth(auth)
    where(uid: auth[:uid]).update(
      :email => auth[:email],
      :name => auth[:name],
      :image => auth[:image],
      :oauth_token => auth[:token]
    )
    where(uid: auth[:uid]).first_or_create do |user|
      user.email = auth[:email]
      user.password = Devise.friendly_token[0,20]
      user.name = auth[:name] 
      user.image = auth[:image]
      if auth[:birthday].nil?
        user.birthday = nil
      else
        user.birthday = Date.strptime(auth[:birthday], "%m/%d/%Y")
      end
      user.oauth_token = auth[:token] 
      user.save!
    end
  end

  def as_json(options = {})
    super(options.merge({ except: [:created_at,:updated_at, :provider, :oauth_expires_at, :oauth_token, :uid, :phone_number, :blocked] }))  
  end
end
