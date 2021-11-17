Enable Artifact Registry API, Kubernetes Engine API
install gcloud SDK and login

Setup Gcloud credential helper for Docker: 
`gcloud auth configure-docker us-east1-docker.pkg.dev
`

`docker tag k8s-flask-api us-central1-docker.pkg.dev/liatrio-kubernetes-api/flask-api-k8s/flask-api-k8s`

`docker push us-central1-docker.pkg.dev/liatrio-kubernetes-api/flask-api-k8s/flask-api-k8s`

install Waypoint and init
`waypoint install --platform=kubernetes -accept-tos`
`waypoint init`


gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)

