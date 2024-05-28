FROM tomcat:8.5.55-jdk8-openjdk

COPY . .

RUN curl -LJO https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz && \
    tar -xvf ./apache-maven-3.8.8-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.8.8 /opt/maven && \
    rm ./apache-maven-3.8.8-bin.tar.gz
ENV M2_HOME /opt/maven
ENV MAVEN_HOME /opt/maven
ENV PATH ${M2_HOME}/bin:${PATH}
ENV MAVEN_CONFIG /root/.m2

ENV MB_ENVIRONMENT prod
ENV JAVA_OPTS -Dmb.interval=5000


RUN mvn clean package ; java -jar "mergebase-RuntimeDemo1.jar" --name="event-manager-app"  --inoculate target/demo-app.war;  cp target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh","run"]
