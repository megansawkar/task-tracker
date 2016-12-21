class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items

  before_save { self.role ||= :member }

  enum role: [:member]

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(email).downcase # rubocop:disable ColonMethodCall
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
