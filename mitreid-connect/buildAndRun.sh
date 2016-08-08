#!/bin/bash

echo "Build start"
export BUILDER_NAME=mitreid-builder
export ROOT_PATH=/vagrant/mitreid-connect/

echo "execute build for " + ${BUILDER_NAME}
docker run -v ${ROOT_PATH}build/build_in:/build_in -v ${ROOT_PATH}build/build_out:/build_out --name ${BUILDER_NAME} neths/docker-alpine-jdk-mvn

echo "build finish ==> copying output files"
rm -rf ./mitreid_data/*
cp ./build/build_out/openid-connect-server-webapp.war ./mitreid_data/ROOT.war
cp ./build/build_out/uma-server-webapp.war ./uma_data/ROOT.war

echo "cleanning"
docker rm -v ${BUILDER_NAME}

echo "mitreid-connect build successful"

docker-compose up -d