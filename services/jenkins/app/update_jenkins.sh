#!/bin/bash
curl $JENKINS_URL/jnlpJars/jenkins-cli.jar -o jenkins-cli.jar
echo "" > pluginUpdate.sh
java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_ADMIN_USER:$JENKINS_ADMIN_PASS -webSocket list-plugins | while read -r plugin version; do
    echo "java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_ADMIN_USER:$JENKINS_ADMIN_PASS -webSocket install-plugin $plugin -deploy" >> pluginUpdate.sh
done;
. ./pluginUpdate.sh