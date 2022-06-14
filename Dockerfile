FROM          maven
RUN           useradd -m roboshop
USER          roboshop
WORKDIR       /home/roboshop
COPY          pom.xml .
COPY          src/ src/
RUN           ls -ltr
ENV           JAVA_HOME=/opt/java/openjdk PATH=/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bi
RUN           mvn package
RUN           mv target/shipping-1.0.jar shipping.jar
ENTRYPOINT    ["java", "-jar", "shipping.jar"]