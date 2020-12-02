#!/usr/bin/env bash

echo "This is an App Center Post-Build script. For more information on how to use App Center build scripts vist: https://docs.microsoft.com/en-us/appcenter/build/custom/scripts"

export SONAR_SCANNER_VERSION=4.4.0.2170
export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-macosx
curl --create-dirs -sSLo $HOME/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-macosx.zip
unzip -o $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/
export PATH=$SONAR_SCANNER_HOME/bin:$PATH
export SONAR_SCANNER_OPTS="-server"

sonar-scanner \
  -Dsonar.organization=oarm14 \
  -Dsonar.projectKey=oarm14_appcenter-sampleapp-android \
  -Dsonar.sources=./src \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.java.binaries=.build\libs\
