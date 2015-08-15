# This is '.cshrc' - it lives in your home directory
# It gets read by EVERY new shell (csh) that you start.
# At login time, this file is read before '.login'

# First call the system and group CSHRC files.

# DO NOT DELETE THE NEXT LINE UNLESS YOU *KNOW* WHAT YOU ARE DOING
if (-r /usr/local/lib/profiles/CSHRC ) source /usr/local/lib/profiles/CSHRC

# Place your own customisations (if any) after this line.
# h4k1m: custom prompt
set prompt='%{\033[1;32m%}%n@%m %{\033[1;31m%}%~ $%{\033[0;37m%} '

# Override the default printer and uncomment below:
# setenv PRINTER your_choice_here
# setenv LPDEST $PRINTER
