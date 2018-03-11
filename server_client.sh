while [ 1 ]; do
  d=$(date '+%H:%M:%S')
  read -p "$USER [$d] > " input
  echo $input > send_pipe
done
