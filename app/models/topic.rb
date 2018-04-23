class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title
end
