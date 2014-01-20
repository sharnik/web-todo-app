p = Project.create!(name: 'Dog stuff', description: 'Just some stuff a dog does')

Task.create!(project: p, content: 'Eat')
Task.create!(project: p, content: 'Sleep')
Task.create!(project: p, content: 'Wag the tail')

p = Project.create!(name: 'Cat stuff', description: 'Just some stuff a dog would never do')
Task.create!(project: p, content: 'Meow')
Task.create!(project: p, content: 'Pee on the lemon tree')
