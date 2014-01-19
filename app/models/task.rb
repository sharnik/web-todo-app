class Task < ActiveRecord::Base
  class AlreadyClosedException < Exception; end

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
end
