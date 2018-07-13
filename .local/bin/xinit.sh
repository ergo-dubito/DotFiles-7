# Load alternate mappings - Capslock control
xmodmap ~/.Xmodmap

# Tap Capslock for Esc, Hold Return for Control
xcape -e 'Control_L=Escape'
xcape -e 'Control_R=Return'

# Keyboard repeat rate
xset r rate 200 45

# Turn on redshift
redshift &
