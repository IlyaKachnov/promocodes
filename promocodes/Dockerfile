#build stage
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

#runtime

ENV YOUTUBE_API_KEY=YOUTUBE_API_KEY
ENV GPT_TOKEN=GPT_TOKEN
ENV POSTGRES_PASSWORD=passw0rd

FROM eclipse-temurin:21
WORKDIR /app
COPY --from=build /build/target/promocodes-*.jar /app

EXPOSE 8081

CMD java -jar promocodes-latest.jar