# Jenkins Test
The Jenkins Test application is an application to test Jenkins pipelines with a simple Java Maven project.

## Installation
This application runs in a Docker container with a Payara image.

## Setup
This application requires a properties file, this properties file includes the sensitive information like passwords etc.  
Rename `src/main/resources/FillMe.properties` to `src/main/resources/helloworld.properties`, open it and fill add your configuration.  
```properties
# NOTE: Debug purposes
skipTests: false

# urls
baseurl: http://example.com
contextroot: helloworld
```

## Usage
This application runs with Docker, to make things more easily `docker.sh` was added.  
First you have to open the file and fill in your docker registry. If your registry is protected by a password make sure that your device has the credentials stored:  
```bash
docker login -u <username> -p <password> registry.example.com
```
Than use it as written below:  
```bash 
./docker.sh mvn build push run
```
Where:  
* `mvn`: Build the project with maven
* `build`: Build the Docker image
* `push`: Push to Docker server's registry
* `run`: Run the Docker image locally

Whenever you run this application, the following end-points become available:
* `<Your URL>/helloworld`: Contains a Hello World end point to show the application is working.