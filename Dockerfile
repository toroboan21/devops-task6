FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install git -y && apt-get install default-jdk -y && apt-get install maven -y && apt-get install tomcat8 -y
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/ && mvn package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat8/webapps/
CMD [catalina.sh, run]
