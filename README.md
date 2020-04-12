# nginx-config

remember to run with global mode, --mode global, and in the host network, --network host, like so:

docker service create --name nginx-with-config --mode global --network host --with-registry-auth <image>
