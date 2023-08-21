require 'rubygems'

# configurar gems listadas na gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
