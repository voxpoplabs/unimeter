class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  def renew
    update_attribute :end_date, Date.today + 1.month
  end
end
