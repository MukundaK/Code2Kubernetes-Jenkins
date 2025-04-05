FROM eclipse-temurin:17.0.14_7-jre-alpine-3.21
EXPOSE 8080
ADD target/*.jar spring-petclinic.jar
ENTRYPOINT ["java","-jar","/spring-petclinic.jar"]
