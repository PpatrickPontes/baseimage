## imagename aliimage:1.0
FROM frolvlad/alpine-oraclejdk8:cleaned

#ENV LC_ALL=en_US.UTF-8

#RUN apk add --update wget   && rm -rf /var/cache/apk/*



RUN wget http://oam.alicdn.com/tools/apache-maven-3.3.9-bin.tar.gz
RUN tar -zxvf apache-maven-3.3.9-bin.tar.gz
RUN rm apache-maven-3.3.9-bin.tar.gz
RUN mkdir /opt && mkdir /opt/alibaba && mkdir /root/.m2
ADD settings.xml /root/.m2/settings.xml
RUN mv apache-maven-3.3.9 /opt/alibaba/maven


ENV MAVEN_HOME=/opt/alibaba/maven
ENV MAVEN=$MAVEN_HOME/bin
ENV PATH=$PATH:$MAVEN_HOME:$MAVEN

ADD localtime /etc/localtime
ADD localtime /usr/share/zoneinfo/Asia/Shanghai
ADD zone /etc/sysconfig/clock
CMD mvn --version
