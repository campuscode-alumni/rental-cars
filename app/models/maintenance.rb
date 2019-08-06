class Maintenance < ApplicationRecord
  belongs_to :car
  belongs_to :provider
end
