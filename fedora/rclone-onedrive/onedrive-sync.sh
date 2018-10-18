#!/bin/sh

remote_name=onedrive
mount_point=/mnt/workspace/onedrive

# Copy from mount point to remote.
echo "Updating remote with local changes..."
rclone copy $mount_point $remote_name:/ --progress

# Copy from remote to mount point.
echo "Updating mount point with remote changes..."
rclone copy $remote_name:/ $mount_point --progress

echo "Done."
