#build stage
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

#runtime
FROM eclipse-temurin:21
WORKDIR /app2
COPY --from=build /build/target/telegram-api-*.jar /app2

EXPOSE 8082

ENTRYPOINT ["java","-jar","telegram-api-latest.jar"]