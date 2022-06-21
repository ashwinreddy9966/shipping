FROM          maven:3-openjdk-8
RUN           useradd -m roboshop
USER          roboshop
WORKDIR       /home/roboshop
COPY          pom.xml .
COPY          src/ src/
RUN           ls -ltr
RUN           env && mvn package
RUN           mv target/shipping-1.0.jar shipping.jar
ENTRYPOINT    ["java", "Xms", "-jar", "shipping.jar"]

# FROM          debian:latest AS builder
# RUN           apt-get update && apt-get -y install maven
# RUN           useradd -m roboshop
# WORKDIR       /home/roboshop/
#
# COPY          pom.xml .
# RUN           mvn dependency:resolve
# COPY          src/ src/
# RUN           mvn package && ls -ltr
#
# #
# # Run
# #
# FROM openjdk:8-jdk
# EXPOSE 80
# WORKDIR /home/roboshop
# COPY --from=builder /home/roboshop/target/shipping-1.0.jar shipping.jar
# CMD [ "java", "-jar", "shipping.jar" ]