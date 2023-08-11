# Comprendre Kubernetes (K8s)

- **FROM openjdk:17-jdk** : Cela spécifie l'image de base à utiliser, qui est OpenJDK 17.

- **VOLUME /tmp** : Cela crée un point de montage de volume à /tmp.

- **COPY target/demo_k8s-0.0.1-SNAPSHOT.jar app.jar** : Cela copie le fichier JAR construit à partir du répertoire target de votre projet dans le conteneur en tant que app.jar.

- **ENTRYPOINT ["java", "-jar", "/app.jar"]** : Cela définit la commande qui sera exécutée lorsque le conteneur démarre. Elle exécute l'application Java en lançant le fichier JAR à l'aide de la commande java.

## Dockerfile
````
FROM openjdk:17-jdk
VOLUME /tmp
COPY target/demo_k8s-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
````

## Comprendre Kubernetes (K8s)
**Kubernetes (K8s)** est une plateforme open-source destinée à automatiser le déploiement, la mise à l'échelle et la gestion d'applications conteneurisées. Il offre des fonctionnalités puissantes pour rendre vos applications plus résilientes et scalables.

### Auto-guérison (Self-Healing)

Kubernetes surveille en permanence l'état de vos applications et réagit automatiquement en cas de défaillance. Si un conteneur ou un nœud échoue, Kubernetes redémarre automatiquement les conteneurs et gère les remplacements pour maintenir l'intégrité de l'application.

### Rollback & Rollout

Avec Kubernetes, vous pouvez gérer les mises à jour d'application en douceur. Les mécanismes de déploiement de type "Rolling Update" vous permettent de mettre à jour vos applications en minimisant les temps d'arrêt, tout en permettant des rollbacks faciles en cas de problème.

### Équilibrage de Charge (Load Balancing)

Kubernetes distribue automatiquement le trafic entre les instances d'application pour optimiser les performances et la disponibilité. Cela garantit que les utilisateurs sont dirigés vers des instances saines et évite les surcharges.

### Mise à l'Échelle Horizontale (Horizontal Scaling)

Kubernetes facilite l'ajout ou la suppression dynamique de ressources pour vos applications en fonction de la demande. Vous pouvez augmenter ou réduire le nombre d'instances de vos applications en quelques clics.

## Architecture de Kubernetes

### Noeuds Maîtres (Master Nodes)

- **ETCD** : La base de données de Kubernetes pour ajouter la configuration du cluster.
- **Scheduler** : Pour attribuer de nouveaux objets au cluster (nœud ouvrier).
- **Control Manager** : Gère les différents contrôleurs qui surveillent l'état de l'application.
- **API Server** : Intercepte les commandes utilisateur ou les appels API, les valide et les traite.

### Noeuds Ouvriers (Worker Nodes)

- **Container Runtime** : Environnement d'exécution des conteneurs.
- **Kubelet** : Agent qui communique avec le nœud maître pour garantir le bon fonctionnement des applications.
- **K-Proxy** : Agent de réseau qui gère les règles de réseau sur les nœuds.
- **Add-ons** : Logiciels intégrés pour exécuter des conteneurs (DNS, Dashboard).

## Lien avec Docker

Kubernetes utilise par défaut Docker comme moteur d'exécution de conteneurs. Cependant, à partir de la dernière version en 2020, il a été remplacé par **Containerd** en tant que runtime par défaut.

L'objectif ultime de Kubernetes est de rendre vos applications robustes et évolutives, en gérant automatiquement des aspects tels que la résilience, la mise à l'échelle et la distribution de la charge.


# Exemples de Commandes Kubernetes avec Minikube


## Minikube

Minikube est un outil qui permet de créer et de gérer une instance locale de cluster Kubernetes. Cela vous permet de développer, tester et expérimenter des applications Kubernetes sur votre propre machine sans avoir besoin d'un environnement de cluster complet. Minikube crée un seul nœud de cluster Kubernetes virtuel dans une machine virtuelle locale et fournit une interface simple pour interagir avec ce cluster.

L'utilisation de Minikube est utile pour :

- Développer et tester des applications Kubernetes localement.
- Apprendre et s'entraîner à utiliser Kubernetes.
- Tester les déploiements, services, volumes et autres fonctionnalités sans avoir besoin d'un environnement en ligne.

Pour commencer avec Minikube, vous pouvez exécuter la commande suivante :


## Démarrer Minikube avec Hyper-V

```bash
minikube start --driver=hyperv
````

## Récupérer l'Image Docker

```bash
docker pull developpeurk/lucky-app
````

## Créer un Déploiement Kubernetes

```bash
kubectl create deployment luckyapp --image=developpeurk/lucky-app
````


## Mettre à Jour une Image de Déploiement

```bash
kubectl set image deployment/luckyapp luckyapp=developpeurk/lucky-app
````

## Décrire un Pod

```bash
kubectl describe pod luckyapp
````

## Obtenir le Nom du Conteneur dans un Déploiement

```bash
kubectl get deployment luckyapp -o jsonpath='{.spec.template.spec.containers[*].name}'
````

## Afficher les Logs d'un Pod

```bash
kubectl logs luckyapp-59b6c547dc-2vzd8
````

## Supprimer un Pod

```bash
kubectl delete pod luckyapp-59b6c547dc-2vzd8
````

## Décrire un Pod en Temps Réel

```bash
kubectl describe pod -w luckyapp-59b6c547dc-nb8jc
````

## Afficher en Temps Réel les Logs d'un Pod

```bash
kubectl logs -f luckyapp-59b6c547dc-nb8jc
````

## Ouvrir le Tableau de Bord Minikube

```bash
minikube dashboard
````

## Supprimer Tous les Déploiements

```bash
kubectl delete --all deployments
````

## Obtenir la Liste des Déploiements


```bash
kubectl get deployments
````

## Obtenir la Liste des ReplicaSets

```bash
kubectl get replicasets
````

## Obtenir l'Adresse IP de Minikube

```bash
minikube ip
````

## Vérifier l'État de Minikube

```bash
minikube status
````

## Afficher le Contenu d'un Fichier YAML de Déploiement  (windows PowerShell)

Pour afficher le contenu d'un fichier YAML de déploiement appelé `lucky-app-deployment.yaml`, vous pouvez utiliser la commande suivante :

```bash
Get-Content lucky-app-deployment.yaml
````

## Éditer un Fichier YAML de Déploiement (Windows)

```bash
notepad lucky-app-deployment.yaml
````


## Explication du Fichier YAML de Déploiement

Le fichier YAML de déploiement contient la configuration nécessaire pour déployer une application dans Kubernetes. Voici une explication détaillée de chaque élément du fichier :

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: lucky-app-deployment
  labels:
    app: lucky-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: lucky-app
  template:
    metadata:
      labels:
        app: lucky-app
    spec:
      containers:
      - name: lucky-app
        image: developpeurk/lucky-app
        ports:
        - containerPort: 80
````

## Explication du Fichier YAML de Déploiement

Le fichier YAML de déploiement que vous voyez décrit comment déployer une application dans Kubernetes. Voici une explication détaillée de chaque élément du fichier :

### apiVersion et kind

- `apiVersion`: Indique la version de l'API à utiliser. Dans ce cas, nous utilisons la version `apps/v1` de l'API pour les déploiements.
- `kind`: Spécifie le type d'objet que nous déployons. Ici, c'est un déploiement.

### metadata

- `metadata`: Contient les métadonnées de l'objet.
  - `name`: Le nom du déploiement, défini comme `lucky-app-deployment`.
  - `labels`: Des étiquettes (labels) pour identifier et organiser l'objet. Dans ce cas, l'étiquette `app` est définie comme `lucky-app`.

### spec

- `spec`: Contient les spécifications pour le déploiement.
  - `replicas`: Le nombre de répliques (instances) de l'application à exécuter. Ici, nous en avons 1.
  - `selector`: Spécifie comment le déploiement trouve les pods cibles à gérer.
    - `matchLabels`: Les étiquettes à utiliser pour sélectionner les pods cibles. Ici, il s'agit de l'étiquette `app: lucky-app`.
  - `template`: Contient les spécifications du pod à déployer.
    - `metadata`: Métadonnées du pod.
      - `labels`: Étiquettes du pod. Dans ce cas, `app: lucky-app` correspond au sélecteur du déploiement.
    - `spec`: Spécifications du pod lui-même.
      - `containers`: Liste des conteneurs à exécuter dans le pod.
        - `name`: Nom du conteneur, ici `lucky-app`.
        - `image`: L'image Docker à utiliser pour le conteneur, `developpeurk/lucky-app` dans ce cas.
        - `ports`: Liste des ports à exposer depuis le conteneur.
          - `containerPort`: Le port du conteneur que nous exposons, ici 80.

Cette configuration décrit comment déployer une réplique de l'application "lucky-app" en utilisant l'image "developpeurk/lucky-app" et en exposant le port 80.


## Appliquer la Configuration d'un Déploiement depuis un Fichier

```bash
kubectl apply -f lucky-app-deployment.yaml
````

## Obtenir la Liste des Déploiements avec Détails

```bash
kubectl get deployments -o wide
````


## Obtenir la Liste des Pods en Utilisant des Labels

```bash
kubectl get pods --selector app=lucky-app
````

## kubectl get pods --selector app=lucky-app

```bash
kubectl get pods --selector app=lucky-app
````

## Afficher les Logs d'un Déploiement

```bash
kubectl logs lucky-app-deployment-6b54b76785-fwp48
````

## Exposer un Service avec un Load Balancer

```bash
kubectl expose deployment lucky-app-deployment --name=luckyapp-service  --port=80 --target-port=8080 --type=LoadBalancer
````

## Démarrer le Tunnel Minikube

```bash
minikube tunnel
````

## Obtenir la Liste des Services

```bash
kubectl get service
````






