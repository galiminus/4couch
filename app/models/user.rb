class User < ActiveRecord::Base
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => ["64x64>", :jpg] }

  extend FriendlyId
  friendly_id :username, use: :slugged

  include Gravtastic
  gravtastic :size => 64

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :login, :username, :email,
                  :password, :password_confirmation,
                  :remember_me, :locale, :name, :website, :biography

  attr_accessor :login

  has_one :place
  has_many :conversations

  def new_messages?
    conversations.where(read: false).count.nonzero?
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
