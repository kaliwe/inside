class User < ApplicationRecord
  has_many :identities
  validates :email, uniqueness: true
  validates :name, uniqueness: true

  def self.create_with_oauth(info)
    new name: info['name'], email: info['email']
  end
end
