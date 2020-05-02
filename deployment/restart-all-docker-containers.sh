docker kill snowman-multi
docker run --rm -d -p 4000:4000 --name snowman-multi mikemjharris/snowman-multi
docker kill snowman
docker run --rm -d -p 3000:8000 --name snowman mikemjharris/snowman 
docker kill animated-message
docker run --rm -d -p 8000:8080 --name animated-message mikemjharris/animated-message
#docker kill mongodb
#docker rm mongodb
#docker run -d -p 27017:27017 -v /data/db:/data/db --name mongodb mongo
docker kill blog
#docker run -d -p 7000:8000 --link mongodb:mongodb --name blog mikemjharris/blog
docker run --rm -d -p 7000:8000  --name blog mikemjharris/blog
docker kill star-wars-twitter
docker run --rm -d -p 3001:3000 --name star-wars-twitter star-wars-new
#docker kill b-reel
#docker rm b-reel
#docker run -d -p 7001:8000 --name b-reel mikemjharris/b-reel
/bin/bash ~/deployment/build-view-from-the-ra.sh
/bin/bash ~/deployment/build-books.sh
/bin/bash ~/deployment/build-preview.sh
