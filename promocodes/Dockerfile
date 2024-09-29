FROM eclipse-temurin:21
WORKDIR /app
COPY .mvn/ ./mvn

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

CMD ["./mvnw", "mvn spring-boot:build-image -Dmodule.image.name=promocodes -Dmaven.test.skip=true"]