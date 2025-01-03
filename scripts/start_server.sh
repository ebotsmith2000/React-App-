#!/bin/bash
echo starting server
export IMAGE_TAG=$(aws ecr describe-images --repository-name react-app --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' --output text)
docker run -d -p 80:80 --name react-app-server 510786428272.dkr.ecr.us-east-1.amazonaws.com/react-app:$IMAGE_TAG
echo server started
exit
