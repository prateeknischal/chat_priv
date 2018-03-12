if [ "$#" -ne 1 ]; then
  echo "usage: ./client.sh <server_IP_address>"
  exit -1
fi

rm client_pipe
mkfifo client_pipe

openssl s_client -connect $1:4433 -quiet -nbio 1>client_pipe
