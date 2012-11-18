Fabricator(:conversation) do
  user(fabricator: :user)
  recipient(fabricator: :user)
end
