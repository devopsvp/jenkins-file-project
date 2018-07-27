FROM tomcat:7

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

COPY ./target/zettamine.war /usr/local/tomcat/webapps/

VOLUME /usr/local/tomcat/webapps/

EXPOSE 8080
