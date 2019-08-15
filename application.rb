#!/usr/bin/env ruby
# Using Ruby, create a command line application that recursively reads all of the images from the supplied directory of images, extracts their EXIF GPS data (longitude and latitude), and then writes the name of that image and any GPS co-ordinates it finds to a CSV file.
#
#   This utility should be executable from the command line (i.e.: ‘ruby ./app.rb’ or as an executable).
#   With no parameters, the utility should default to scanning from the current directory. It should take an optional parameter that allows any other directory to be passed in.
#

require './app/lendesk'
require 'optionparser'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: application.rb [options]"
#   As a bonus, output either CSV or HTML, based on a parameter passed in via the command line.
  opts.on("--html", "Output in HTML format (default is CSV)") do
    options[:format] = :html
  end
  opts.on("-o FILE", "--output-file=FILE", String, "File to output to. (Default: 'image_gps_info.{csv,html}')") do |output_file|
    options[:output_file] = output_file
  end
  opts.on("-d DIR", "--target-directory=DIR", "Target directory to scan for JPG files. (Default: current directory)") do |target_directory|
    options[:target_directory] = output_file
  end
  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse

options[:target_directory] ||= Dir.pwd
options[:format]           ||= :csv
options[:output_file]      ||= 'image_gps_info.' + (options[:format] == :csv ? 'csv' : 'html')

Lendesk::ImageDirectoryScanner.call(**options)
