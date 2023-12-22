FROM openjdk:17
ENTRYPOINT ["java", "-jar", "app.jar"]
COPY ./build/libs/Calculator-0.0.1-SNAPSHOT.jar /app.jar

