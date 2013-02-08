class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :created_at, :id, :state, :title, :updated_at
end
