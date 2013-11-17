
Fabricator(:xassembly) do
  name { "x_name-#{sequence(:x_name, 10000)}" }
end
