class Project < ActiveRecord::Base
  has_many :items, class_name: Task

  validates :name, presence: true

  def done?
    items.where(completed_at: nil).count == 0
  end
end
