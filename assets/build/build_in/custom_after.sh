#!/bin/bash

echo "copying war file into output"
cp ${BUILD_DIR}/my-openid-connect/target/my-openid-connect-server.war /build_out

echo "cleaning"
rm -rf ${BUILD_DIR}/*

