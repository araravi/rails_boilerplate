# If the environment differs from the stage name
set :rails_env, 'production'

server '<Production IP>', user: 'developer', roles: %w{web app}