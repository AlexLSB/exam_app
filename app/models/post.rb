class Post < ActiveRecord::Base
  belongs_to :user
	
	after_initialize do
	  if self.new_record?
    # values will be available for new record forms.
	    self.state = 'pending'
  	end
	end
  validates :title,
     :presence => true, :length => { :maximum => 140 },
     :if => lambda { |o| o.state != "deleted" }
 
  validates :title, :uniqueness => { :case_sensitive => false }
   
  validates :content, :presence => true,
    :if => lambda { |o| o.state != "deleted" }
  validates_inclusion_of :state, :in => ["pending", "active", "deleted"]  
  attr_accessible :content, :created_at, :id, :state, :title, :updated_at

end
