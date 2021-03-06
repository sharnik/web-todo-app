require 'spec_helper'

describe Task do
  let(:task) { FactoryGirl.create(:task) }

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
    let(:task) { FactoryGirl.create(:task) }

    before { task.complete }

    it 'completes the task' do
      task.closed?.should == true
    end

    it 'sets the completion time' do
      (Time.now - task.completed_at).should < 2.seconds
    end
  end

  describe '#open' do
    let(:task) { FactoryGirl.create(:task, completed_at: 2.hours.ago) }

    before { task.open }

    it 're-opens the task' do
      task.open?.should == true
    end

    it 'sets the completion time to nil' do
      task.completed_at.should be_nil
    end
  end

end
