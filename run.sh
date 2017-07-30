while true
do
        inotifywait -e create -e modify  /opt/calibre/library/metadata.db
        pkill calibre-server
        /usr/bin/calibre-server --with-library=/opt/calibre/library
done