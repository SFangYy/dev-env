#!/bin/bash

# Start SSH service
/usr/sbin/sshd

# Start VNC server for the 'user' user
# Ensure D-Bus session is launched and environment variables are set.
# Then, start vncserver, which will pick up the ~/.vnc/xstartup script by default.
su - sfangyy -c "eval \`dbus-launch --sh-syntax\` && \
exec /usr/bin/vncserver $DISPLAY -geometry $VNC_GEOMETRY -depth $VNC_DEPTH -localhost no"

# Keep the container running
# This is necessary because vncserver will detach itself.
tail -f /dev/null
