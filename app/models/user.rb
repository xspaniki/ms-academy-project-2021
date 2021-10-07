class User < ApplicationRecord
  belongs_to :organization, class_name: 'Organization'
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
