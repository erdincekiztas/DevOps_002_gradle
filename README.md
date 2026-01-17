# DevOps
## Gradle

### Network

```
docker network ls
```
---
Aynı komutlar
```
docker network create -d bridge my-bridge-network
```
```
docker network create --driver bridge my-network
```
---
Bu networkü kim kullanacak ?

 ---
Çalışan bir container'ın network'e bağlanması ve kullanması lazım.

Image--> run--> Container1 (kalp)

Image--> run--> Container2 (beyin)

Image--> run--> Container3 (akciğer)

bunların bir arada çalışması lazım

Container1 + Container2 + Container3
```` 
docker network connect my-network Container1

docker network connect my-network Container2

docker network connect my-network Container3
````

Network hakkındaki bilgileri görmek için
````
docker network inspect my-network
````
networkten bir containeri çıkartmak
````
docker network disconnect my-network Container3
````
---
### Docker Volume

````
docker volume ls
````
```
docker volume create volume_adı
```
```
docker volume rm 
```
---
## Docker compose

```
docker compose version
```
### Seçilen dockerfile dosyasını çalıştırır
```
docker compose -f compose.yaml up

docker compose --file compose.yaml up
```
### Seçilen dockerfile dosyasını durdurur
```
docker compose -f compose.yaml down

docker compose --file compose.yaml down
```
### ================ KUBERNETES K8S ================

#### Kurulum
https://minikube.sigs.k8s.io/

windows
```
winget install Kubernetes.minicube
```

Bir terminal aç.
minikube çalıştır 
``minikube start``

İşin bitince minikube aracını durdur 
``minikube stop``

Kubernetes pod çekme 
 ``kubectl get pods``

### Kubernetes ile imageden pod(container)  oluşturup çalıştırma
```
kubectl run mginx --image=nginx
```
```
kubectl run my-pod1 --image=erdincekzts/devops_001_web:v003
```

Sistemdeki Kaynakların isimlerindeki kısaltmalar 
````
kuberctl api-resources
````
pod detayları verir
````
kubectl get pods -o wide
````

nodları listele
````
kubectl get no
kubectl get node
kubectl get nodes
````

### Docker Image oluştur
Info: komut devops_001_web/ dizini içerisinde çalıştırılmalı !!
```
docker build buildx --build-arg JAR_FILE=buid/libs/devops_001_web-1.0.0.jar --tag KULLANICI_ADI/devops_001_web:v003 . 
```
her image için ekstra latest üretilmeli
```
docker build buildx --build-arg JAR_FILE=buid/libs/devops_001_web-1.0.0.jar --tag KULLANICI_ADI/devops_001_web:latest . 
```

###   ========= Deployment ==========
```
kubectl  apply  -f   _01_my_deployment_create.yaml
```

```
kubectl  delete  -f   _01_my_deployment_create.yaml
```

---

### ==== Service ====
```
kubectl  apply  -f   _01_my_service_create.yaml
```

```
kubectl  delete  -f   _01_my_service_create.yaml
```



### Servis ile podlara erişim sağlıyoruz. Burada port random geliyor.
```
minikube  service   devops-002-hello
```


### web tarayıcısından portu sabitliyoruz. Pod'un içindeki uygulamaya erişiyoruz.
```
kubectl port-forward service/devops-002-hello 9090:9090
```
