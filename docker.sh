#!/bin/bash

# Initialize parameters
registry=
name=helloworld

mvn=0
build=0
push=0
run=0

# Make sure that the comparisons are not case sensitive
shopt -s nocasematch

# Process command line arguments
# mvn:   Build the project with maven
# build: Build the Docker image
# push:  Push to Docker server's registry
# run:   Run the Docker image locally
for var in "$@"
do
	if [ ${var} == "mvn" ]; then
		mvn=1
	elif [ ${var} == "build" ]; then
		build=1
	elif [ ${var} == "push" ]; then
		push=1
	elif [ ${var} == "run" ]; then
		run=1
	else
		# TODO: Implement help flag?
		echo "Known parameters: mvn|build|run|push"
		exit -1
	fi
done

# Build the project with maven
if [ ${mvn} == 1 ]; then
    mvn clean verify
fi

# Build the docker image
if [ ${build} == 1 ]; then
    docker build -t ${registry}/${name} .

    if [ ${push} == 1 ]; then
        docker push ${registry}/${name}
        docker rmi ${registry}/${name}
    fi
fi

# Run the docker image
if [ ${run} == 1 ]; then
    docker run -p 8080:8080 -p 4848:4848 --rm ${registry}/${name}
fi
