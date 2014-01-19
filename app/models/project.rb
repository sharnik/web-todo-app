class Project < ActiveRecord::Base
  has_many :items, class_name: Task

  validates :name, presence: true

end
