class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable
  # and :omniauthable
  belongs_to :subsidiary
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
