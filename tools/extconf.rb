# Loads mkmf which is used to make makefiles for Ruby extensions
require 'rubygems'
require 'mkrf'

Mkrf::Generator.new('pemethods', 'pemethods.c') do |g|
    g.cflags << "`pkg-config --cflags --libs glib-2.0`" 
end
