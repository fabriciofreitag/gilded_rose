Dir['model/sub_items/*.rb'].each do |file|
  require_relative '../' + file
end
require_relative '../gilded_rose'
require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation
end