class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
 validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
    has_secure_password
      validates :password, presence: true, length: { minimum: 6 }
      validates :birth_day, presence: true
      validate :validates_birthday_compare_now
      validates :phone_number, presence: true, numericality: true, length: { minimum: 10 }
      enum sex: [ :Male, :Female]
      validates :sex, presence: true 
  def validates_birthday_compare_now
    if birth_day.present? && birth_day.to_date > Time.now.to_date
      errors.add(:birth_day, 'must be in the past')
    end
    if birth_day.present? && birth_day.to_date <= Time.now.to_date - 5.years
      errors.add(:birth_day, 'must be after 5 years ago ')
    end
  end 
end