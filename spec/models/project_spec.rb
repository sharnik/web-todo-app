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
end
