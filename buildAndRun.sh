#!/bin/bash

echo "Build start"
export BUILDER_NAME=mitreid-builder
export BUILDER_ASSET_PATH=/vagrant/assets/build
export RUN_PATH=./run

echo "Setup"
mkdir -p ${RUN_PATH}/mitreid_data
mkdir -p ${RUN_PATH}/postgres_data

mkdir -p ${BUILDER_ASSET_PATH}/build_in/mitre
cp -R ./mitreid-connect/* ${BUILDER_ASSET_PATH}/build_in/mitre

echo "Execute build for " + ${BUILDER_NAME}
docker run -v ${BUILDER_ASSET_PATH}/build_in:/build_in -v ${BUILDER_ASSET_PATH}/build_out:/build_out --name ${BUILDER_NAME} neths/docker-alpine-jdk-mvn

echo "Build finish ==> copying output files"
cp ${BUILDER_ASSET_PATH}/build_out/my-openid-connect-server.war ${RUN_PATH}/mitreid_data/ROOT.war

echo "Cleanning"
docker rm -v ${BUILDER_NAME}

echo "Mitreid-connect build successful"

echo "Start application"

docker-compose up -d
