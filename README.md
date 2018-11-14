# SwarmFrontend

Build and run the sample with Docker

You can build and run the sample in Docker using the following commands. The instructions assume that you are in the root of the repository.

docker build -t frontend .
<br/>
docker run --name frontend_sample --rm -it -p 8000:80 frontend
