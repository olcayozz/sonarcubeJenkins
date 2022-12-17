
docker-compose down
git checkout
docker-compose up -d --build jenkins
docker exec -it jenkins_olcay sh /app/update_jenkins.sh
docker-compose up -d --build sonarqube

