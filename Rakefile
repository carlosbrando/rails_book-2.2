LANGUAGES = %w( pt en it fr )

require 'script/merge'
require 'script/html'
require 'script/pdf'
require 'script/prince'

task :default => [:pdf]

task :clean do
  `rm -rf output/*`
end