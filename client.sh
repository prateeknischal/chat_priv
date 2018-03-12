rm client_pipe
mkfifo client_pipe
function() {
  if [ "$#" -ne 1 ]; then
    echo "usage: ./client.sh <server_IP_address>"
    exit -1 
}
openssl s_client -connect $1:4433 -brief -nbio 2>/dev/null 1>client_pipe
