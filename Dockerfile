FROM          maven:3.8.5-eclipse-temurin-17-alpine
RUN           useradd -m roboshop
USER          roboshop
WORKDIR       /home/roboshop
COPY          pom.xml .
COPY          src/ src/
RUN           ls -ltr
RUN           mvn package
RUN           mv target/shipping-1.0.jar shipping.jar
ENTRYPOINT    ["java", "-jar", "shipping.jar"]