class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: /\A[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}\z/i }

  has_many :products
end
