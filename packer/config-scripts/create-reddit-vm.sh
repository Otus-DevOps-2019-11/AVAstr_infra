#!/bin/bash

gcloud compute instances create reddit-full \
--zone=europe-west1-b \
--image-family=reddit-full \
--machine-type=g1-small \
--tags=puma-server
