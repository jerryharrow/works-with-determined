
# Unset proxies so we can use pachyderm API 
unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY

echo >&2 "INFO: Mounting /pfs"
unshare -Ufirmp pachctl mount /mnt/pfs -r dogs-and-cats@master=818589ca &
sleep 5
rmdir /pfs
ln -sf /proc/$(pgrep pachctl)/root/mnt/pfs /
echo >&2 "INFO: Content of /pfs"
find >&2 /pfs/*
