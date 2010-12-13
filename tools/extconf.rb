# Loads mkmf which is used to make makefiles for Ruby extensions
require 'rubygems'
require 'mkmf'

$CPPFLAGS << "`pkg-config --cflags glib-2.0`"
dir_config(ENV['PWD'])

have_header('math.h')
find_header('gmp.h', '/usr/local/include')
have_header('omp.h')

have_library('glib-2.0', 'g_array_new')
have_library('pthread', 'pthread_create')

create_makefile('pemethods')
