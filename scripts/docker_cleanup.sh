# prune                           = clean up any resources — images, containers, volumes, and networks — that are dangling 
# prune-all                       = To additionally remove any stopped containers and all unused images
# rm-all-images                   = Remove all images
# list-images-regex + regex       = list images matching pattern
# rm-images-regex + regex         = remove images matching pattern
# list-container-status + status  = list containers by status - created, restarting, running, paused, or exited
# rm-container-status + status    = remove containers by status - created, restarting, running, paused, or exited
# stop-all                        = stop all containers
# rm-all                          = remove all containers

# more commands https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes

if $1 == "prune"; then
  docker system prune
fi

if $1 == "prune-all"; then
  docker system prune -a
fi

if $1 == "rm-all-images"; then
  docker rmi $(docker images -a -q)
fi


if $1 == "list-images-regex"; then
  docker images -a |  grep "$2"
fi


if $1 == "rm-images-regex"; then
  docker images -a | grep "$2" | awk '{print $3}' | xargs docker rmi
fi


if $1 == "list-container-status"; then
  docker ps -a -f status=$2
fi


if $1 == "rm-container-status"; then
  docker rm $(docker ps -a -f status=$2 -q)
fi

if $1 = "stop-all"; then
  docker stop $(docker ps -a -q)
fi

if $1 = "rm-all"; then
  docker rm $(docker ps -a -q)
fi