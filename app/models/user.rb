class User < ApplicationRecord
  has_many :identities
  validates :email, uniqueness: true

  def self.create_with_oauth(info)
    user = find_by email: info['email']
    if user.nil?
      create name: info['name'], email: info['email']
    end
  end
end
