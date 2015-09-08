class Book < ActiveRecord::Base
  validates :title, presence: true
  scope :finished, -> {where("finished_at IS NOT NULL")}
  scope :available, ->{where(archived_at: nil)}

 def archive 
   self.archived_at = Time.now
   self.save
 end 
end
