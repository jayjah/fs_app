#!/bin/zsh
protoc --dart_out=grpc:lib/src/generated \
  -Iprotos protos/* \
  --plugin=protoc-gen-dart=$HOME/.pub-cache/bin/protoc-gen-dart \
  google/protobuf/timestamp.proto