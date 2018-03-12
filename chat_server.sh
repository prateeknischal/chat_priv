#create a file if does not exists
echo "killing cat and openssl"
pkill -9 -x cat
pkill -9 -x openssl

if [ ! -f recv_pipe ]; then
  touch recv_pipe;
fi

function cleanup() {
  echo "Cleanup..."
  echo "kill pipe"
  kill -9 $pipe_proc_id 2>/dev/null
  echo "remove input and output pipes"
  rm -rf send_pipe recv_pipe
  echo "kill openssl"
  pkill -x openssl 2>/dev/null
}

trap cleanup SIGKILL SIGINT SIGTERM

# init_send_pipe

#clear pipe
# dd if=send_pipe iflag=nonblock of=/dev/null

echo "Starting server on localhost:4433..."
#start the server
rm send_pipe 2>/dev/null
mkfifo send_pipe
echo "created pipe"
nohup $(cat>send_pipe) &
pipe_proc_id=$!
echo "cat process id :" $pipe_proc_id

openssl s_server -key certs/key.pem -cert certs/chat.pem -nbio -quiet 2>/dev/null 1>recv_pipe <send_pipe

# openssl s_client -connect localhost:4433 -brief -quiet -nbio 2>/dev/null 1>client_pipe
# write to send_pipe to send to client
# tail recv_pipe and client_pipe
