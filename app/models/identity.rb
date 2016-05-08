class Identity < ApplicationRecord
  belongs_to :user

  def self.find_by_oauth(auth)
    find_by(uid: auth['uid'], provider: auth['provider'])
  end

  def self.create_with_oauth(auth)
    new(uid: auth['uid'], provider: auth['provider'])
  end
end
