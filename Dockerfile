FROM openjdk:17-jdk
VOLUME /tmp
COPY target/demo_k8s-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
