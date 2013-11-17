
Fabricator(:part2) do
  name { "part_name-#{sequence(:part, 10000)}" }
end
