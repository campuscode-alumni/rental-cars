class Transaction < ApplicationRecord
  belongs_to :subsidiary
  belongs_to :transactable, polymorphic: true
end
