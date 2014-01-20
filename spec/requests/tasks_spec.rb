require 'spec_helper'

describe TasksController do

  describe '#index' do
    before do
      2.times { |k| FactoryGirl.create(:task, content: "Task ##{k + 1}") }
      get tasks_url, {}, { Accept: 'application/json' }
    end

    it 'responds with 200 OK' do
      response.should be_success
    end

    it 'returns task list' do
      json.size.should == 2
    end

    it 'returns details of a task' do
      json.first['content'].should == 'Task #1'
    end

    it 'returns project of a task' do
      json.first['project'].should_not be_nil
    end
  end

  describe '#create' do
    let(:project){ FactoryGirl.create(:project) }
    before do
      post tasks_url, {task: {content: 'New task', project_id: project.id}}, { Accept: 'application/json' }
    end

    it 'responds with 200 OK' do
      response.should be_success
    end

    it 'returns task data' do
      json.first['id'].should_not be_nil
      json.first['content'].should == 'New task'
    end

    it 'should create a record in the database' do
      Task.count.should == 1
    end
  end

  describe '#complete' do
    let(:task){ FactoryGirl.create(:task, completed_at: nil) }

    before do
      post complete_task_url(task), {}, { Accept: 'application/json' }
    end

    it 'responds with 200 OK' do
      response.should be_success
    end

    it 'should update the record in the database' do
      task.reload.closed?.should == true
    end
  end

  describe '#open' do
    let(:task){ FactoryGirl.create(:task, completed_at: 3.hours.ago) }

    before do
      post open_task_url(task), {}, { Accept: 'application/json' }
    end

    it 'responds with 200 OK' do
      response.should be_success
    end

    it 'should update the record in the database' do
      task.reload.open?.should == true
    end
  end
end
