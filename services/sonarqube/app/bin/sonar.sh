#!/usr/bin/env bash
echo "##############################################                 SONAR              ##############################################"
exec java -jar lib/sonar-application-"${SONAR_VERSION}".jar -Dsonar.log.console=true "$@"
