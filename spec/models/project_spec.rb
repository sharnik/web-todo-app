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
end
