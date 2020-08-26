# frozen_string_literal: true

namespace :deploy do
  namespace :faster_symlink do
    desc 'Symlink files and directories from shared to release'
    multitask shared: %w[linked_files linked_dirs]

    desc 'Symlink linked directories'
    task :linked_dirs do
      next unless any? :linked_dirs

      on release_roles :all do
        execute :mkdir, '-p', linked_dir_parents(release_path)

        commands = fetch(:linked_dirs).map do |dir|
          target = release_path.join(dir)
          source = shared_path.join(dir)

          "[ -L #{target} ] || (([ -d #{target} ] && rm -rf #{target} ) ; ln -s #{source} #{target})"
        end

        execute "(#{commands.join(') && (')})"
      end
    end

    desc 'Symlink linked files'
    task :linked_files do
      next unless any? :linked_files

      on release_roles :all do
        execute :mkdir, '-p', linked_file_dirs(release_path)

        commands = fetch(:linked_files).map do |file|
          target = release_path.join(file)
          source = shared_path.join(file)

          "[ -L #{target} ] || (([ -f #{target} ] && rm #{target} ) ; ln -s #{source} #{target})"
        end

        execute "(#{commands.join(') && (')})"
      end
    end
  end
end

Rake::Task['deploy:symlink:shared'].clear.enhance do
  invoke 'deploy:faster_symlink:shared'
end
