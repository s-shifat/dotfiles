#!/bin/bash

mkdir ./lua/user/$1
touch ./lua/user/$1/init.lua
touch ./lua/user/$1/config.lua
echo "require(\"user.$1.config\")" >> ./lua/user/$1/init.lua
echo "require(\"user.$1\")" >> ./lua/user/init.lua
