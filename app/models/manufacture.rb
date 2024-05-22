class Manufacture < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validate :email_domain_check

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    email = conditions.delete(:email)
    if email
      where(conditions.to_h).where(["email = :value", { value: email, domain: '%@karazin.ua' }]).first
    else
      where(conditions.to_h).first
    end
  end

  private

  def email_domain_check
    allowed_domains = ["karazin.ua"]
    email_domain = email.split("@").last
    unless allowed_domains.include?(email_domain)
      errors.add(:email, "домен вашої електронної пошти повинен бути karazin.ua")
    end
  end
end
