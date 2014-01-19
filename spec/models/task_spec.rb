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

  describe '#complete' do
    let(:task) { Task.new }

    before { task.complete }

    it 'completes the task' do
      task.closed?.should == true
    end

    it 'sets the completion time' do
      (Time.now - task.completed_at).should < 2.seconds
    end
  end

end
