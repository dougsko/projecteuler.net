# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

# Give it a name
extension_name = 'pemethods'

# The destination
dir_config(ENV['PWD'])

# Do the work
#create_makefile(extension_name)
create_makefile('pemethods')
