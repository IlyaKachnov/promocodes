#build stage
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

#runtime

ENV YOUTUBE_API_KEY: missing_password
ENV GPT_TOKEN: missing_password
ENV POSTGRES_PASSWORD: missing_password

FROM eclipse-temurin:21
WORKDIR /app
COPY --from=build /build/target/promocodes-*.jar /app

EXPOSE 8081

ENTRYPOINT ["java","-jar","promocodes-latest.jar"]