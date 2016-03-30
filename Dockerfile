FROM ubuntu:16.04


ADD localtime /etc/localtime
ADD localtime /usr/share/zoneinfo/Asia/Shanghai
ADD zone /etc/sysconfig/clock

ADD jdk1.8.0_77 /opt/alibaba/java8
ADD tengine /opt/alibaba/tengine
ADD nodejs /opt/alibaba/nodejs

RUN ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /lib/x86_64-linux-gnu/libcrypto.so.6 && ln -s /lib/x86_64-linux-gnu/libssl.so.1.0.0 /lib/x86_64-linux-gnu/libssl.so.6

ENV JAVA_HOME=/opt/alibaba/java8
ENV JAVA8=$JAVA_HOME/bin
ENV NODE_HOME=/opt/alibaba/nodejs
ENV NODE=$NODE_HOME/bin
ENV TENGINE_HOME=/opt/alibaba/tengine


ENV PATH=$PATH:$NODE:$JAVA8:$TENGINE_HOME/sbin




