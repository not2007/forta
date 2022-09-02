#agents="unknown"
agents=$(docker ps -a | grep -E forta-agent | awk '{print $1}')
if [ ! -n "$agents" ]
then
    echo "no agents"
else
    echo $agents
    docker stop $agents
    docker rm $agents
    docker image rm $(docker image ls -a -q)
fi
