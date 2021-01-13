# Prepare script
tmpfile=$(mktemp)
echo "" >> ${tmpfile}
echo "block all" >> ${tmpfile}
echo "" >> ${tmpfile}

# Run
pfctl -f ${tmpfile}
pfctl -e 
read -p "Press enter to continue"
pfctl -d
pfctl -f /etc/pf.conf

# clean up
rm ${tmpfile}
