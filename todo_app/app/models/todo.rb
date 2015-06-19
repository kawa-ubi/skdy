class Todo < ActiveRecord::Base
	
	validates_presence_of :task
	
	belongs_to :user
	
	def self.order_by_column(column = :due)
		self.all.order column
  end


  paginates_per 3

  def self.list_all
    Todo.order(:due)
  end

  def self.list_by_user(user_id)
    Todo.where(user_id: user_id).order(:due)
  end
end
