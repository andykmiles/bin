FROM python:3.9-slim-buster

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

ENV PATH="/home/andy/.local/bin:/home/andy/.poetry/bin:${PATH}"
#    && 'EXPORT PS1="$ "'

RUN git config --global user.email "akmiles@icloud.com"
RUN git config --global user.name "Andy Miles"
RUN python -m pip install --upgrade pip
RUN python -m pip install loguru
RUN python -m pip install pysnooper
RUN python -m pip install pytest
RUN python -m pip install pytest-cov
RUN python -m pip install pytest-bdd
RUN python -m pip install tox
RUN python -m pip install pytest-mock
RUN python -m pip install pre-commit

USER root
RUN apt-get autoremove \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* 
