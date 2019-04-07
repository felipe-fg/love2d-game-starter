#!/usr/bin/env bash
BASE_FOLDER=$(pwd)/..
ARTIFACT_NAME=game.love

mkdir -p $BASE_FOLDER/dist
rm $BASE_FOLDER/dist/$ARTIFACT_NAME

(cd $BASE_FOLDER/src && zip -r $BASE_FOLDER/dist/$ARTIFACT_NAME *)
