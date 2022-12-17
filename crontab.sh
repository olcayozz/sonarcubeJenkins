


docker-compose -f /root/repo/EXECUTION_REPO_sonarcubeJenkins/docker-compose.yml down
[ -d "/root/repo/sonarcubeJenkins/.git" ] && \
(git --git-dir=/root/repo/sonarcubeJenkins/.git pull && \
cp -rf /root/repo/sonarcubeJenkins /root/repo/EXECUTION_REPO_sonarcubeJenkins) || \
(git clone https://github.com/olcayozz/sonarcubeJenkins /root/repo/sonarcubeJenkins && \
cp -rf /root/repo/sonarcubeJenkins /root/repo/EXECUTION_REPO_sonarcubeJenkins && \
rm -rf /root/repo/EXECUTION_REPO_sonarcubeJenkins/.git && \
mkdir /root/repo/EXECUTION_REPO_sonarcubeJenkins/services/jenkins/data && \
cp -r /jenkins /root/repo/EXECUTION_REPO_sonarcubeJenkins/services/jenkins/data/jenkins)
docker-compose -f /root/repo/EXECUTION_REPO_sonarcubeJenkins/docker-compose.yml up -d --build jenkins
sleep 300
docker exec -it jenkins_olcay sh /app/update_jenkins.sh
sleep 30
docker exec -it jenkins_olcay sh java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_ADMIN_USER:$JENKINS_ADMIN_PASS -webSocket restart
chmod +x /root/repo/EXECUTION_REPO_sonarcubeJenkins/services/sonarqube/app/bin/*
docker-compose up -d --build sonarqube