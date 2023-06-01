class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :comments
  has_many :subscriptions

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create
  before_validation :downcase_email

  after_commit :link_subscriptions, on: :create

  private

  def set_name
    self.name = "#{I18n.t("controllers.users.comrad")}#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end

  def downcase_email
    email&.downcase!
  end
end
