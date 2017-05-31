class Tip < ApplicationRecord
  belongs_to :user, optional: true
end
