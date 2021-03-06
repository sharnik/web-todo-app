class Task < ActiveRecord::Base
  class AlreadyClosedException < Exception; end
  class AlreadyOpenException < Exception; end

  belongs_to :project
  validates :project_id, presence: true

  def open?
    completed_at.nil?
  end

  def closed?
    !open?
  end

  def complete
    if open?
      update!(:completed_at => Time.now)
    else
      raise AlreadyClosedException
    end
  end

  def open
    if closed?
      update!(:completed_at => nil)
    else
      raise AlreadyOpenException
    end
  end
end
