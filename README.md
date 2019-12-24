# AVAstr_infra
testapp_IP = 34.76.198.217
testapp_port = 9292

#gcloud + satrtup_script

gcloud compute instances create reddit-app \
--zone:europe-west1-b \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata-from-file startup-script=startup_script.sh

#gcloud + firewall_rule

gcloud compute \
--project=infra-262607 firewall-rules create default-puma-server \
--direction=INGRESS \
--priority=1000 \
--network=default \
--action=ALLOW \
--rules=tcp:9292 \
--source-ranges=0.0.0.0/0 \
--target-tags=puma-server
