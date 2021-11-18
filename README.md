# Flask API for K8S
Dockerized Flask API to run on GKE and deploy with Waypoint. 

## Prerequisites
- Install the gcloud SDK and authenticate.
- Install Docker, Terraform, and Waypoint
- Create a GCP project 
- Enable Artifact Registry API, Kubernetes Engine API
- Setup gcloud credential helper for Docker: 
`gcloud auth configure-docker us-central1-docker.pkg.dev
`

## Installation
From ./terraform run:
`terraform init && terraform apply`

Get kubectl credentials for cluster: 

```
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
```

Intall the Waypoint server on the cluster:

`waypoint install --platform=kubernetes -accept-tos`

### Optional: Waypoint Server Access
Access the Waypoint server on `https://<SERVER_IP>:9702` and run `waypoint user token` to generate the login token. This gives you access to see exiting projects, builds, deployments, and releases.  

## Waypoint Deployment
From ./k8s-flask-api, build, deploy and release the app with: `waypoint init && waypoint up`

You can access the app from the URL provided. 

You can also register a DNS for the app with: `waypoint hostname register` and access the app from anywhere.

## Cleanup
Run `terraform destroy` to clean up the GCP infra. This will destroy the Waypoint server and the app, too. 
