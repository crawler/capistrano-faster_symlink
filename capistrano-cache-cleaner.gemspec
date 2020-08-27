# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name                  = 'capistrano-faster_symlink'
  gem.version               = '1.0.0'
  gem.date                  = '2020-08-26'
  gem.summary               = 'Faster replacement for the capistrano deploy:symlink:shared task'
  gem.description           = <<~DESC
    Does linked_files linked_dirs tasks with one command execution per task in parallel, using a
    rake multitask feature.

    If you have an appreciable quantity of files/dirs to link, then that way is faster than original
    tasks that do one command per-directory/file to link and getting called one after another.
  DESC
  gem.authors               = ['Anton Topchii']
  gem.email                 = 'player1@infinitevoid.net'
  gem.homepage              =
    'https://github.com/crawler/capistrano-faster_symlink'
  gem.license               = 'MIT'

  gem.files                 =
    %w[lib/capistrano/faster_symlink.rb lib/capistrano/tasks/faster_symlink.rake]
  gem.require_paths         = ['lib']
  gem.required_ruby_version = '>= 2.7'

  gem.add_dependency 'capistrano', '~> 3.0'
end
