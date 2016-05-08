Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'c1ca1a3c634144162f1b', '56440fa79e09f66568787c60b58c273df8e42511', scope: 'user:email'
  provider :vk, '5454017', 'IGueK9vqi5eRTKHxHLY8', scope: 'email'
end
