class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable
  # and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :rentals
  belongs_to :subsidiary
end
