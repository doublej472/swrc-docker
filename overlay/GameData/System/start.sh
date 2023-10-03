#!/bin/bash

# Set password
sed -i 's/^AdminPassword=.*$/AdminPassword='"${PASSWORD:-password}"'/' /repcom/GameData/System/ModMPGame.ini
sed -i 's/^NetServerMaxTickRate=.*$/NetServerMaxTickRate='"${TICKRATE:-20}"'/' /repcom/GameData/System/system.ini

wine UCC.exe Engine.ServerCommandlet
