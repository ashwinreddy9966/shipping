FROM          maven:eclipse-temurin AS builder
RUN           adduser --disabled-password  --home /app --gecos "" roboshop
USER          roboshop
WORKDIR       /app
COPY          src/ src/
COPY          pom.xml pom.xml
RUN           mvn clean package
RUN           mv target/shipping-1.0.jar shipping.jar

FROM          openjdk:8u322-jre-buster
COPY          --from=builder /app/shipping.jar .
ENTRYPOINT    ["java", "-jar", "shipping.jar"]