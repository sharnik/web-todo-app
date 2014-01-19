json.array! @tasks do |task|
  json.(task, :id, :completed_at, :content)
end

