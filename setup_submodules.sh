#!/bin/bash

git pull
git submodule init
git submodule update
git submodule status
git submodule foreach git pull origin master
git submodule foreach npm install