FROM registry.access.redhat.com/ubi8/openjdk-17:1.17
LABEL maintainer="Raj"
LABEL version="1.0"
WORKDIR /app
COPY target/java-docker.jar /app/java-docker.jar
ENTRYPOINT ["java"]
CMD ["-jar", "java-docker.jar"]