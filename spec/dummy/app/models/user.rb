class User < ActiveRecord::Base
  has_many :scorings, as: :subjectable
end
