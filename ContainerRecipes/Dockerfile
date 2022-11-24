FROM ubuntu:22.04
RUN apt update     \
    && export DEBIAN_FRONTEND=noninteractive     \
    && apt install wget curl python3 python3-tk python3-dev graphviz -y -q     \
    && apt -y install python3-pip     \
    && apt -y install python3.10-venv     \
    && apt -y install openssh-client sqlite3      \
    && apt install build-essential libssl-dev libffi-dev -y -q     \
    && mkdir -p /opt     \
    && cd /opt     \
    && python3 -m venv venv     \
    && . venv/bin/activate     \
    && which pip3     \
    && pip3 install autosubmit     \
    && autosubmit -h 
ENV PATH=$PATH:/opt/venv/bin
ENTRYPOINT ["/opt/venv/bin/autosubmit"]
