#!/bin/bash
gif-for-cli --display-mode=256 -l 3 /root/bin/gifs/party.gif

echo "Welcome. Press the RETURN key to continue. >"
read > /dev/null # stdinにあるENQなど制御シーケンスを捨てる

while true
do
  echo "To exit, press Ctrl+] and type 'quit'."
  echo "Enter the following words or any free word, gif file URL."

  # プリセットのgifファイル名を表示
  for file in /root/bin/gifs/*; do
    filename=$(basename "$file")
    filename_without_ext="${filename%.*}"
    echo "$filename_without_ext"
  done

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
