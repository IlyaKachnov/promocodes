#build stage
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

#runtime
FROM eclipse-temurin:21
WORKDIR /app
COPY --from=build /build/target/telegram-api-*.jar /app

EXPOSE 8081

ENTRYPOINT ["java","-jar","telegram-api.jar"]