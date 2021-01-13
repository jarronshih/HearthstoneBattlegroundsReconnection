# You need to run this scrip using sudo

# Prepare script
tmpfile=$(mktemp)
echo "" >> ${tmpfile}
echo "block all" >> ${tmpfile}
echo "" >> ${tmpfile}

# Run
sudo pfctl -f ${tmpfile} 2>/dev/null
sudo pfctl -e 2>/dev/null && echo "Disable connection"
read -p "Press enter to continue"
sudo pfctl -d 2>/dev/null && echo "Enable connection"
sudo pfctl -f /etc/pf.conf 2>/dev/null

# clean up
rm ${tmpfile}
