class Code < ApplicationRecord
  validates :name, uniqueness: true
end
