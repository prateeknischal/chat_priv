rm client_pipe
mkfifo client_pipe

openssl s_client -connect localhost:4433 -brief -nbio 2>/dev/null 1>client_pipe
