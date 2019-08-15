#!/usr/bin/env ruby
# Using Ruby, create a command line application that recursively reads all of the images from the supplied directory of images, extracts their EXIF GPS data (longitude and latitude), and then writes the name of that image and any GPS co-ordinates it finds to a CSV file.
#
#   This utility should be executable from the command line (i.e.: ‘ruby ./app.rb’ or as an executable).
#   With no parameters, the utility should default to scanning from the current directory. It should take an optional parameter that allows any other directory to be passed in.
#

require './app/lendesk'

Lendesk::ImageDirectoryScanner.start_cli
