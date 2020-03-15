FROM centos:7.7.1908

COPY ./src/ /
COPY ./run.sh /

RUN chmod +x /run.sh \
&& cp -f /confs/crontab /etc/crontab  \
&& yum install -y crontabs \
&& yum localinstall -y /app-pkg/ossfs_1.80.6_centos7.0_x86_64.rpm 

CMD ["/bin/bash","/run.sh"]
