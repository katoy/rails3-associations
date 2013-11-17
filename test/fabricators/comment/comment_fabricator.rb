
Fabricator(:comment) do
  user_name { "comment_user_name-#{sequence(:comment_user_name, 2000)}" }
  body { "comment_body-#{sequence(:comment_body, 1000)}" }
  idea
end
