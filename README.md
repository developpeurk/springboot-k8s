# springboot-k8s

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


