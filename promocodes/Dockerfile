#build stage
FROM eclipse-temurin:21
USER root
COPY russian_trusted_root_ca_pem.crt $JAVA_HOME/lib/security
COPY russian_trusted_sub_ca_pem.crt $JAVA_HOME/lib/security
COPY ngw.devices.sberbank.ru.crt $JAVA_HOME/lib/security

RUN \
  cd $JAVA_HOME/lib/security \
  && keytool -importcert -file russian_trusted_root_ca_pem.crt -alias root_cert -cacerts -storepass changeit -noprompt \
  && keytool -importcert -file russian_trusted_sub_ca_pem.crt -alias sub_cert -cacerts -storepass changeit -noprompt \
  && keytool -importcert -file ngw.devices.sberbank.ru.crt -alias devices_cert -cacerts -storepass changeit -noprompt

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