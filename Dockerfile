# FROM          maven
# RUN           useradd -m roboshop
# USER          roboshop
# WORKDIR       /home/roboshop
# COPY          pom.xml .
# COPY          src/ src/
# RUN           ls -ltr
# RUN           env && mvn package
# RUN           mv target/shipping-1.0.jar shipping.jar
# ENTRYPOINT    ["java", "-Xms2900m", "-jar", "shipping.jar"]

FROM          debian AS build
RUN           apt-get update && apt-get -y install maven
RUN           useradd -m roboshop
WORKDIR       /home/roboshop

COPY          pom.xml .
RUN           mvn dependency:resolve
COPY          src/ src/
RUN           mvn package && ls -ltr

#
# Run
#
FROM openjdk:8-jdk
EXPOSE 80
WORKDIR /home/roboshop
COPY --from=build /opt/shipping/target/shipping-1.0.jar shipping.jar
CMD [ "java", "-jar", "shipping.jar" ]