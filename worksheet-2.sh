#!/bin/sh

## Configure git your data
git config --global user.name paulomur 
git config --global user.email paulomur4@gmail.com

## Change the "origin" remote URL and push
git remote set-url origin git@github.com:paulomur/handouts_SESYNC.git

## Set the SESYNC-CI repository upstream and pull updates
git remote add upstream https://github.com/paulomur/handouts_SESYNC.git
git pull upstream master
