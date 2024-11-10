namespace :bun do
  desc <<-DESC
        Install the project dependencies via bun. By default, devDependencies \
        will not be installed. The install command is executed \
        with the --production, --silent and --no-spin flags.

        You can override any of these defaults by setting the variables shown below.

          set :bun_target_path, nil
          set :bun_flags, '--production --silent --no-spin'
          set :bun_roles, :all
          set :bun_env_variables, {}
          set :bun_method, 'install'
    DESC
  task :install do
    on roles fetch(:bun_roles) do
      within fetch(:bun_target_path, release_path) do
        with fetch(:bun_env_variables, {}) do
          execute :bun, fetch(:bun_method), fetch(:bun_flags)
        end
      end
    end
  end

  before 'deploy:updated', 'bun:install'

  desc <<-DESC
        Remove extraneous packages via bun. This command is executed within \
        the same context as bun install using the bun_roles and bun_target_path \
        variables.

        By default prune will be executed with the --production flag.  You can \
        override this default by setting the variable shown below.

          set :bun_prune_flags, '--production'

        This task is strictly opt-in.  If you want to run it on every deployment \
        before you run bun install, add the following to your deploy.rb.

          before 'bun:install', 'bun:prune'
    DESC
  task :prune do
    on roles fetch(:bun_roles) do
      within fetch(:bun_target_path, release_path) do
        execute :bun, 'prune', fetch(:bun_prune_flags)
      end
    end
  end

  desc <<-DESC
        Rebuild via bun. This command is executed within the same context \
        as bun install using the bun_roles and bun_target_path \
        variables.

        This task is strictly opt-in. The main reason you'll want to run this \
        would be after changing bun versions on the server.
    DESC
  task :rebuild do
    on roles fetch(:bun_roles) do
      within fetch(:bun_target_path, release_path) do
        with fetch(:bun_env_variables, {}) do
          execute :bun, 'rebuild'
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :bun_flags, %w(--production --silent --no-progress)
    set :bun_prune_flags, '--production'
    set :bun_roles, :all
    set :bun_method, 'install'
  end
end
