#!/bin/sh

remote_name=onedrive
mount_point=/mnt/workspace/onedrive


echo "---"
echo "Installing rclone"
echo "---"
echo "Summary: Installing, configuring and synching rclone."
echo "Remote Name: $remote_name"
echo "Local Mount Point: $mount_point"
echo "---"
echo "1. Installing rclone..."
curl https://rclone.org/install.sh | bash

echo "2. Starting rclone configuration..."
rclone config

echo "3. Synching remote with local mount point..."
rclone sync $remote_name:/ $mount_point -P

echo "4. Replacing ~/Documents and ~/Pictures by a symlink..."
rm -rf ~/Documents
ln -s $mount_point/Documents ~/Documents

rm -rf ~/Pictures
ln -s $mount_point/Pictures ~/Pictures

echo "5. Creating link to sync script on /usr/local/bin/onedrive-sync.sh..."
ln -s ./onedrive-sync.sh /usr/share/bin/onedrive-sync.sh

echo "6. Creating entry on crontab..."
echo "Add the following line: "
echo "0,30 * * * * /usr/local/bin/onedrive-sync.sh"
echo "Press enter to continue to edit the crontab."
read press_key
crontab -u $USER

echo "Done."
