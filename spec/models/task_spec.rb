require 'spec_helper'

describe Task do
  let(:task) { Task.new }

  describe "that is open" do
    it "knows that it's open" do
      task.open?.should == true
    end

    it "can be completed" do
      task.complete

      task.open?.should == false
    end
  end

  describe "that is closed" do
    before do
      task.complete
    end

    it "knows that it's closed" do
      task.closed?.should == true
    end

    it "can't be closed" do
      expect { task.complete }.to raise_error(Task::AlreadyClosedException)
    end
  end

end
