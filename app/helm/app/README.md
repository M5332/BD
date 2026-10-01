# Deploy app with Helm

The chart deploys the Spring Boot application, an internal MySQL service, and a persistent volume claim for MySQL data. The app is exposed as a ClusterIP service.

## Build the application image

From the repository root:

```powershell
docker build -f app/Dockerfile -t app:0.0.1 app
```

Make the image available to your cluster. For Minikube, run `minikube image load app:0.0.1`; for kind, run `kind load docker-image app:0.0.1`. For a remote cluster, push the image to a registry and set `image.repository` and `image.tag` in the Helm values.

## Create database credentials

Create the Secret in the same namespace where Helm will install the release. Replace both example values with strong passwords:

```powershell
kubectl create secret generic app-db-credentials --from-literal=mysql-root-password="REPLACE_WITH_ROOT_PASSWORD" --from-literal=app-password="REPLACE_WITH_APP_PASSWORD"
```

The secret must contain `mysql-root-password` and `app-password` keys. The chart does not create or store these credentials.

## Install

```powershell
helm upgrade --install app ./app/helm/app
kubectl rollout status deployment/app
kubectl port-forward service/app 8080:8080
```

Open `http://localhost:8080/Shello` to check the application. To remove the release, run `helm uninstall app`. This also deletes the chart-managed database PVC and its data, so back up any data you need before uninstalling.

For a remote registry, install with values such as `--set image.repository=REGISTRY/IMAGE --set image.tag=0.0.1`. Ensure the Kubernetes nodes can pull that image.