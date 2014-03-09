class Article < ActiveRecord::Base
  has_many :tasks, as: :taskable
end
