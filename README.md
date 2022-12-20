
# Веб-приложение
Было написано простое веб-приложение Hello world на python с использованием Django.

---

# Docker

### Создание Docker image
*docker build -t nickb6/web:1.0.0 .

### Получение id
*docker images

### Запуск контейнера для проверки работы приложения:
*docker run -it -p 8000:8000 --name=web <image_id>

### Загрузка image на DockerHub:
*docker push nickb6/web:1.0.0

---

# Kubernetes

### Для удобства новый кластер Kubernetes создавался с помощью minikube:
*minikube start

### Установка manifest в кластер Kubernetes:
*kubectl apply -f manifest.yaml

*kubectl get deployments
```NAME   READY   UP-TO-DATE   AVAILABLE   AGE
web    2/2     2            2           39m```

*kubectl describe deployment web -n default
```Name:                   web
    Namespace:              default
    CreationTimestamp:      Wed, 21 Dec 2022 00:05:58 +0300
    Labels:                 env=test
    Annotations:            deployment.kubernetes.io/revision: 1
    Selector:               env=test
    Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
    StrategyType:           RollingUpdate
    MinReadySeconds:        0
    RollingUpdateStrategy:  25% max unavailable, 25% max surge
    Pod Template:
      Labels:  env=test
      Containers:
       web:
        Image:        nickb6/web:1.0.0
        Port:         8000/TCP
        Host Port:    0/TCP
        Environment:  <none>
        Mounts:       <none>
      Volumes:        <none>
    Conditions:
      Type           Status  Reason
      ----           ------  ------
      Available      True    MinimumReplicasAvailable
      Progressing    True    NewReplicaSetAvailable
    OldReplicaSets:  <none>
    NewReplicaSet:   web-58499798bf (2/2 replicas created)
    Events:
      Type    Reason             Age   From                   Message
      ----    ------             ----  ----                   -------
      Normal  ScalingReplicaSet  39m   deployment-controller  Scaled up replica set web-58499798bf to 2
```

### Чтобы обеспечить доступ к web-приложению внутри кластера пробросим порт:
*kubectl port-forward --address 0.0.0.0 deployment/web 8080:8000

Веб-приложение должно быть доступно по адрессу [id]: http://127.0.0.1:8080/hello_docker.html
