( sleep 1; \
  trayer --align right --edge bottom --distance 0 \
         --expand true \
	--heighttype pixel --height 20 \
	--transparent true --alpha 128 \
         --transparent false --tint 0 \
         --SetDockType true & 
  nm-applet & ) &

#exec /usr/bin/dbus-launch ratpoison
#exec /usr/bin/dbus-launch --exit-with-session ratpoison
gnome-settings-daemon &
#exec ratpoison
