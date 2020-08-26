# capistrano-faster_symlink

Faster replacement for the capistrano `deploy:symlink:shared` task

Does `linked_files` and `linked_dirs` tasks with one command execution per task and in a parallel,
using the rake multitask feature.

If you have an appreciable quantity of files/dirs to link, then that way is faster than original
that do one command per directory/file to link and getting called one after another.

## Usage

`gem 'capistrano-faster_symlink', require: false`

In your Capfile:

`require 'capistrano/faster_symlink.rb'`
