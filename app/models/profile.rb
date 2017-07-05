class Profile < ApplicationRecord
#  belongs_to :user THIS IS NOT NECESSARY BUT ADDED BY DEF

  validates :first_name, :last_name, :user_id,
    presence: true

  def full_name
    first_name + " " + last_name
  end
end
