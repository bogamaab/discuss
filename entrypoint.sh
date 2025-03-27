#!/bin/sh

mix deps.get
mix compile
MIX_ENV=test mix compile

npm install

mix phoenix.server
