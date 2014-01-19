class Project < ActiveRecord::Base
  has_many :items, class_name: Task

  validates :name, presence: true

  def done?
    items.where(completed_at: nil).count == 0
  end

  def items_by_days
    result = Hash.new([])
    items.each do |item|
      result[item.created_at.to_date] += [item]
    end

    result
  end

  def recent_items
    items.where ['created_at > ?', Time.now.beginning_of_day]
  end
end
