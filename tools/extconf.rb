# Loads mkmf which is used to make makefiles for Ruby extensions
require 'rubygems'
require 'mkmf'

$CPPFLAGS << "`pkg-config --cflags glib-2.0`"
dir_config(ENV['PWD'])
have_header('math.h')
have_library('glib-2.0', 'g_array_new')
create_makefile('pemethods')
