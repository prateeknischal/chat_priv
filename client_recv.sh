while [ 1 ]; do
  read x <client_pipe
  d=$(date '+%H:%M:%S')
  echo "Anon [$d] > " $x
done
