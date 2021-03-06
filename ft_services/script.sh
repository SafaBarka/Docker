minikube config set memory 3072

minikube delete

#minikube start 
minikube start --vm-driver virtualbox --disk-size 5GB
minikube_ip=$(minikube ip)

#sed -i '' "s/192.168.99.*/$minikube_ip-$minikube_ip/g" ~/Desktop/docker/ft_services/metallb.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
eval $(minikube docker-env)
cd ~/Desktop/docker/ft_services

kubectl apply -f metallb.yaml


cd ~/Desktop/docker/ft_services/influxdb

docker build -t influxdb .

kubectl apply -f influxdb-deployment.yaml

cd ~/Desktop/docker/ft_services/nginx

 docker build -t nginx .

 kubectl apply -f nginx-deployment.yaml

kubectl create -f ~/Desktop/docker/ft_services/pv.yaml

kubectl create -f ~/Desktop/docker/ft_services/pvc.yaml

cd ~/Desktop/docker/ft_services/mysql

docker build -t mysql .

kubectl apply -f mysql-deployment.yaml

cd ~/Desktop/docker/ft_services/phpmyadmin

docker build -t phpmyadmin .

kubectl apply -f phpmyadmin-deployment.yaml


cd ~/Desktop/docker/ft_services/wordpress

docker build -t wordpress .

kubectl apply -f wp-deployment.yaml


cd ~/Desktop/docker/ft_services/grafana

docker build -t grafana .

kubectl apply -f grafana-deployment.yaml

minikube dashboard


#server-grafana start 
#cd /usr/share/grafana
#/usr/sbin/grafana-server web