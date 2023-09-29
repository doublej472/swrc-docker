#!/bin/bash

# Set password
sed -i 's/CHANGEME/'"${PASSWORD:-password}"'/' /repcom/GameData/System/ModMPGame.ini

wine UCC.exe Engine.ServerCommandlet
