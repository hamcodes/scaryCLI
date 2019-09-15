require_relative "./scary/version"
require_relative "./scary/CLI"

module Scary
  class Error < StandardError; end
  # Your code goes here...
end

require 'nokogiri'
require 'open-uri'
require 'pry'
require_relative './scary/cli'
require_relative './scary/horrorfilms'
require_relative './scary/scraper'
require_relative './scary/version'