apk update && apk version |  wc -l | { read test; if [ "$test" -le 1 ];  then  return 1; fi; }
exit $?
