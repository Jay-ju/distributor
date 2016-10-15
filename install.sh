#!/bin/bash

echo "[INFO] Install jar to local repository."

mvn clean install install -Dmaven.test.skip=true
