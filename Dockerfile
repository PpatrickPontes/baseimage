FROM ubuntu:14.04

ADD sources.list /etc/apt/sources.list
ENV TZ=CST-8


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

ENV NODE_PATH=$NODE_HOME/lib/node_modules

ADD package.json /root/package.json 

RUN cd /root && npm install --registry=https://registry.npm.taobao.org


#RUN apt-get update && apt-get install python -y








