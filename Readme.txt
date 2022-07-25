docker run -d -p 8082:8082 docker/getting-started

docker build -t getting-started .

docker run -p 8082:8082 getting-started 

docker run --getting-started  node-appp -d -p 3000:3000 node-app