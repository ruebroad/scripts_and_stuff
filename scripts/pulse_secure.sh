# stop pulse access service
# remove local guid from connstore.dat
# restart service

if [ $1 == "stop" ]; then
  
  sudo launchctl unload /Library/LaunchDaemons/net.pulsesecure.AccessService.plist
fi

#sudo rm -rf "/Library/Application Support/Pulse Secure/Pulse/DeviceId"

#sudo sed -i .bak "/guid/d" "/Library/Application Support/Pulse Secure/Pulse/connstore.dat"

if [ $1 == "start" ] ; then
  open /Applications/"Pulse Secure.app"
  sudo launchctl load /Library/LaunchDaemons/net.pulsesecure.AccessService.plist
fi