#!/bin/bash

echo "copying war file into output"
cp ${BUILD_DIR}/openid-connect-server-webapp/target/openid-connect-server-webapp.war /build_out
cp ${BUILD_DIR}/uma-server-webapp/target/uma-server-webapp-1.2.6.war /build_out/uma-server-webapp.war

echo "cleaning"
rm -rf ${BUILD_DIR}/*

