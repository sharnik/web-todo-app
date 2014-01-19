require 'spec_helper'

describe Project do
  let(:project){ FactoryGirl.create :project }

  describe '#items' do
    before { 2.times { FactoryGirl.create :task, project: project } }

    it 'returns all project task' do
      project.items.size.should == 2
    end

    it 'returns tasks' do
      project.items.first.should be_a Task
    end
  end

  describe '#done?' do
    it 'returns true if no open tasks' do
      FactoryGirl.create(:task, completed_at: 1.hour.ago, project: project)

      project.done?.should == true
    end

    it 'returns false if open tasks exists' do
      FactoryGirl.create(:task, completed_at: nil, project: project)

      project.done?.should == false
    end
  end

  describe '#items_by_days' do
    describe 'with no tasks' do
      it 'returns an empty hash' do
        project.items_by_days.should == {}
      end
    end

    describe 'when tasks exist' do
      before do
        FactoryGirl.create(:task, created_at: DateTime.parse('1983-11-27 13:45'), project: project)
        FactoryGirl.create(:task, created_at: DateTime.parse('1983-11-27 15:45'), project: project)
        FactoryGirl.create(:task, created_at: DateTime.parse('1983-12-05 9:15'), project: project)
      end

      it 'returns a result grouped by days' do
        project.items_by_days[Date.parse('1983-11-27')].size.should == 2
      end

      it 'returns grouped tasks' do
        project.items_by_days[Date.parse('1983-12-05')].first.should be_a Task
      end

      it 'returns a hash' do
        project.items_by_days.should be_a Hash
      end
    end
  end

  describe '#recent_items' do
    before do
      @task1 = FactoryGirl.create(:task, created_at: Time.now.beginning_of_day + 5.hours, project: project)
      @task2 = FactoryGirl.create(:task, created_at: Time.now.beginning_of_day - 5.hours, project: project)
    end

    it 'returns only items from today' do
      project.recent_items.size.should == 1
      project.recent_items.first.should == @task1
    end
  end
end
