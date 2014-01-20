json.array! @tasks do |task|
  json.(task, :id, :completed_at, :content)
  json.project task.project.name
end

