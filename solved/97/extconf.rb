# Loads mkmf which is used to make makefiles for Ruby extensions
require 'rubygems'
require 'mkmf'

dir_config(ENV['PWD'])
have_header('gmp.h')
have_library('gmp')
create_makefile('pe97')
