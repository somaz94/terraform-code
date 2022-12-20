## STEP1 Install NGINX ingress Controller

```bash 
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingressnginx/nginx-0.30.0/deploy/static/mandatory.yaml
namespace/ingress-nginx created
configmap/nginx-configuration created
configmap/tcp-services created
configmap/udp-services created
serviceaccount/nginx-ingress-serviceaccount created
clusterrole.rbac.authorization.k8s.io/nginx-ingress-clusterrole created
role.rbac.authorization.k8s.io/nginx-ingress-role created
rolebinding.rbac.authorization.k8s.io/nginx-ingress-role-nisa-binding created
clusterrolebinding.rbac.authorization.k8s.io/nginx-ingress-clusterrole-nisabinding created
deployment.apps/nginx-ingress-controller created
limitrange/ingress-nginx created
```

## STEP2 Create LoadBalancer Service 

```bash
$ kubectl apply -f service.yaml
service/nginx-svc created
```

## STEP3 Create Service and Pod

```bash
$ kubectl apply -f coffee-deployment.yaml
deployment.apps/coffee created
$ kubectl apply -f coffee-service.yaml
service/coffee-svc created
$ kubectl apply -f tea-deployment.yaml
deployment.apps/tea created
$ kubectl apply -f tea-service.yaml
service/tea-svc created
```

## STEP4 Create Ingress

```bash
$ kubectl apply -f cafe-ingress-uri.yaml
ingress.extensions/cafe-ingress-uri created
```
