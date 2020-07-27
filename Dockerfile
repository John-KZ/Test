FROM tomcat
RUN apt-get update
RUN apt-get install -y maven git
RUN mkdir /home/build
RUN cd /home/build && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd /home/build/boxfuse-sample-java-war-hello/ && mvn package
RUN rm -rf /usr/local/tomcat/webapps/*
RUN cp /home/build/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
