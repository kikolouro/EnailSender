#!/bin/bash
source .env

#$(docker images -q emailsender:$APPVERSION 2> /dev/null)
if [[ "$(docker images -q emailsender:$APPVERSION 2>/dev/null)" == "" ]]; then
  #cd $HOME/emailsender
  docker build -t emailsender:$APPVERSION .
  docker run -v $(pwd)/logs:/app/logs -d emailsender:$APPVERSION 
fi

./delete.sh
