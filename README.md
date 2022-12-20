
# Веб-приложение
Было написано простое веб-приложение Hello world на python с использованием Django.

---

# Docker

### Создание Docker image
docker build -t nickb6/web:1.0.0 .

### Получение id
docker images

### Запуск контейнера для проверки работы приложения:
docker run -it -p 8000:8000 --name=web <image_id>

### Загрузка image на DockerHub:
docker push nickb6/web:1.0.0

---

# Kubernetes

### Для удобства новый кластер Kubernetes создавался с помощью minikube:
minikube start

### Установка manifest в кластер Kubernetes:
kubectl apply -f manifest.yaml

### Чтобы обеспечить доступ к web-приложению внутри кластера пробросим порт:
kubectl port-forward --address 0.0.0.0 deployment/web 8080:8000

Веб-приложение должно быть доступно по адрессу [id]: http://127.0.0.1:8080/hello_docker.html
