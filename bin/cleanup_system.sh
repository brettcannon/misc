set -x

date
df -h
echo

# Remove files built by development tools
find /home/vstinner/dev -name build -print0|xargs -0 rm -rf
find /home/vstinner/python -name build -print0|xargs -0 rm -rf
find /home/vstinner/myprojects -name build -print0|xargs -0 rm -rf
find /home -name .testrepository -print0|xargs -0 rm -rf
find /home -name .tox -print0|xargs -0 rm -rf
find /home -name __pycache__ -print0|xargs -0 rm -rf
find /home \( -name .pyc -o -name .pyo \) -print0|xargs -0 rm -rf

#rm -rf /var/cache/yum
#rm -rf /var/cache/PackageKit
rm -rf /var/spool/abrt/*

# clear /var/cache/PackageKit/?
pkcon refresh force -c -1

# Retain only journald logs of the past 30 days
sudo journalctl --vacuum-time=30d

# clear dnf cache
dnf clean all

echo
date
df -h

