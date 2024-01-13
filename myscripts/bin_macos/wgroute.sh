sudo ip -6 r d ::/1
sudo ip -6 r d 8000::/1
sudo route -q -n add -inet6 ::/1 -interface $1
sudo route -q -n add -inet6 8000::/1 -interface $1
