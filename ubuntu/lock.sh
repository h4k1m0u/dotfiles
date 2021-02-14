#!/bin/sh

B='#00000000'  # blank
C='#8abeb7ff'  # clear ish
D='#8abeb7ff'  # default
T='#8abeb7ff'  # text
W='#454545ff'  # wrong
V='#454545ff'  # verifying

i3lock \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M"  \
--datestr="%A %d/%m/%Y" \
--keylayout 1         \
\
--timesize="80"       \
--radius 160          \
--no-verify           \


# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --timesize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
