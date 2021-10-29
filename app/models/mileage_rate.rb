class MileageRate < ApplicationRecord
  self.ignored_columns = [:user_id] # mileage rates are per casa, not per user

  belongs_to :casa_org

  validates :effective_date, presence: true, allow_blank: false
  validates :effective_date, uniqueness: {scope: [:is_active, :casa_org]}, if: :is_active?
  validates :amount, presence: true, allow_blank: false
  validates :casa_org, presence: true, allow_blank: false
end

# == Schema Information
#
# Table name: mileage_rates
#
#  id             :bigint           not null, primary key
#  amount         :decimal(, )
#  effective_date :date
#  is_active      :boolean          default(TRUE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  casa_org_id    :bigint           not null
#
# Indexes
#
#  index_mileage_rates_on_casa_org_id  (casa_org_id)
#  index_mileage_rates_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
