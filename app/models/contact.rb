class Contact < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  validates :email, presence: true, :format => /\A(\S+)@(.+)\.(\S+)\z/
end
