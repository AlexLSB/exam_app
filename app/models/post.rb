class Post < ActiveRecord::Base
  belongs_to :user
	
	after_initialize do
	  if self.new_record?
    # values will be available for new record forms.
	    self.state = 'pending'
  	end
	end
  validates :title, :presence => true, :length => { :maximum => 140 }
  validates :content, :presence => true
  validates_inclusion_of :state, :in => ["pending", "active", "deleted"]  
  attr_accessible :content, :created_at, :id, :state, :title, :updated_at


end
