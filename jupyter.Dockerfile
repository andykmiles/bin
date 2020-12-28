FROM continuumio/anaconda3

RUN apt update && apt install -y \
		git \
		curl

RUN if ! getent passwd andy; then groupadd -g 1000 andy && useradd -u 1000 -g 1000 -d /home/andy -m -s /bin/bash andy; fi \
    && echo andy:andy | chpasswd \
    && echo 'andy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && mkdir -p /etc/sudoers.d \
    && echo 'andy ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/andy \
    && chmod 0440 /etc/sudoers.d/andy

USER andy

RUN git config --global user.email "akmiles@icloud.com" \
	&& git config --global user.name "Andy Miles" \
	&& mkdir /home/andy/notebooks

ENTRYPOINT ["jupyter", "notebook","--notebook-dir=/home/andy/notebooks","--ip='0.0.0.0'", "--port=8888", "--no-browser"]
