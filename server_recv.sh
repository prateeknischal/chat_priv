rm -rf tmp_pipe
mkfifo tmp_pipe
tail -f -n0 recv_pipe 1>tmp_pipe &

while [ 1 ]; do
  read x < tmp_pipe
  d=$(date '+%H:%M:%S')
  echo "Anon [$d] > " $x
done
