#!/bin/bash
gif-for-cli --display-mode=256 -l 3 /root/bin/gifs/party.gif

echo "Welcome. Press the RETURN key to continue. >"
read > /dev/null # stdinにあるENQなど制御シーケンスを捨てる

while true
do
  echo "Enter [the following words | any free word | gif file URL]."
  echo "To exit, press Ctrl+] and type 'quit'."

  echo "  gundam omedetou party shining zakoshi"
  printf "> "
  read INPUT
  INPUT=`echo $INPUT | tr -d '\r'` # 改行コードを\r\nから\nに

  FILE=/root/bin/gifs/$INPUT.gif 
  if [ -e "$FILE" ]; then
    gif-for-cli --display-mode=256 -l 1 "$FILE"
  else
    gif-for-cli --display-mode=256 -l 1 "$INPUT"
  fi
done


# cat << EOF
# HTTP/1.1 200 OK
# Server: nginx
# Date: Sun, 15 May 2022 13:11:33 GMT
# Content-Type: text/html
# Content-Length: 222
# Connection: keep-alive
# Cache-Control: private, no-store, no-cache, must-revalidate
# Last-Modified: Sun, 15 May 2022 12:23:27 GMT
# ETag: "de-5df0bf98bacd7"
# Accept-Ranges: bytes

# <!DOCTYPE html>
# <html lang="ja">
#   <head>
#     <meta charset="UTF-8">
#   </head>
#   <body>
#     <h1>ベタ書きレスポンスです</h1>
#   </body>
# </html>
# EOF