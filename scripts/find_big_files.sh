sudo find / -path /mnt -prune -o -type f -size +100M -exec ls -lh {} \;
