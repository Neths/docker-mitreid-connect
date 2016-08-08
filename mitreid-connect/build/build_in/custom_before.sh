#!/bin/bash

echo "download mitreid-connect from github release"
wget https://github.com/mitreid-connect/OpenID-Connect-Java-Spring-Server/archive/mitreid-connect-1.2.6.tar.gz
tar -zxvf /build_in/mitreid-connect-1.2.6.tar.gz
rm /build_in/mitreid-connect-1.2.6.tar.gz
mv -f /build_in/OpenID-Connect-Java-Spring-Server-mitreid-connect-*/* ${BUILD_DIR}

echo "view config"
cat ${BUILD_DIR}/openid-connect-server-webapp/src/main/webapp/WEB-INF/server-config.xml

echo "overriding the config"
cp -f /build_in/config/mitreid-connect-webapp/*.xml ${BUILD_DIR}/openid-connect-server-webapp/src/main/webapp/WEB-INF
cp -f /build_in/config/uma-webapp/*.xml ${BUILD_DIR}/uma-server-webapp/src/main/webapp/WEB-INF

echo "view config"
cat ${BUILD_DIR}/openid-connect-server-webapp/src/main/webapp/WEB-INF/server-config.xml
