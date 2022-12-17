
[ -d "/root/repo/sonarcubeJenkins/.git" ] && git --git-dir=/root/repo/sonarcubeJenkins/.git pull || git clone https://github.com/olcayozz/sonarcubeJenkins /root/repo/sonarcubeJenkins
docker-compose -f /root/repo/sonarcubeJenkins/docker-compose.yml down
docker-compose -f /root/repo/sonarcubeJenkins/docker-compose.yml up -d --build jenkins
sleep 300
docker exec -it jenkins_olcay sh /app/update_jenkins.sh
docker-compose up -d --build sonarqube

