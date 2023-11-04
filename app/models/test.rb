class Test < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5}
end
