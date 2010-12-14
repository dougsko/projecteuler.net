# Loads mkmf which is used to make makefiles for Ruby extensions
require 'rubygems'
require 'mkmf'

$CPPFLAGS << "-lgmp -fopenmp `pkg-config --cflags glib-2.0`"
dir_config(ENV['PWD'])

have_header('math.h')
have_header('gmp.h')
have_header('helpers.h')

have_library('glib-2.0', 'g_array_new')
have_library('gmp')

create_makefile('pemethods')
