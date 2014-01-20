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

  describe '#update' do
    let(:task){ FactoryGirl.create(:task, content: 'Old task') }

    before do
      put task_url(task), {task: {content: 'Refubrished task'}}, { Accept: 'application/json' }
    end

    it 'responds with 200 OK' do
      response.should be_success
    end

    it 'returns updated task data' do
      json['id'].should == task.id
      json['content'].should == 'Refubrished task'
    end

    it 'should update the record in the database' do
      task.reload.content.should == 'Refubrished task'
    end
  end

  describe '#destroy' do
    let(:task){ FactoryGirl.create(:task, content: 'Worthless task') }

    before do
      delete task_url(task), {}, { Accept: 'application/json' }
    end

    it 'responds with 200 OK' do
      response.should be_success
    end

    it 'responds with success information' do
      json['status'].should == 'ok'
    end

    it 'should delete the record in the database' do
      Task.count.should == 0
    end
  end
end
