minikube delete

minikube start 

minikube_ip=$(minikube ip)

sed -i '' "s/192.168.99.*/$minikube_ip-$minikube_ip/g" ~/Desktop/docker/ft_services/metallb.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
eval $(minikube docker-env)
cd ~/Desktop/docker/ft_services

kubectl apply -f metallb.yaml

cd ~/Desktop/docker/ft_services/nginx

docker build -t nginx .

kubectl apply -f nginx-deployment.yaml

cd ~/Desktop/docker/ft_services/mysql

docker build -t mysql .

kubectl apply -f mysql-deployment.yaml

minikube dashboard