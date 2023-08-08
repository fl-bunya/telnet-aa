#!/bin/bash

cat << EOF
HTTP/1.1 200 OK
Server: nginx
Date: Sun, 15 May 2022 13:11:33 GMT
Content-Type: text/html
Content-Length: 222
Connection: keep-alive
Cache-Control: private, no-store, no-cache, must-revalidate
Last-Modified: Sun, 15 May 2022 12:23:27 GMT
ETag: "de-5df0bf98bacd7"
Accept-Ranges: bytes

<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
  </head>
  <body>
    <h1>ベタ書きレスポンスです</h1>
  </body>
</html>
EOF