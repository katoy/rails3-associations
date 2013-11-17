
Fabricator(:idea) do
  name { "idea_name-#{sequence(:idea_name, 10000)}" }
  description "description..."
  comments(count: 0)
end
