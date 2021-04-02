FROM ubuntu:latest
ARG terraform_version=0.13.5
ENV terraform_version ${terraform_version}
ARG TF_API_TOKEN=00
ENV TF_API_TOKEN ${TF_API_TOKEN}

####################
# Run APT installs #
####################
RUN apt-get update && apt-get install -yq \
    curl wget git \
    unzip tar sudo \
    && rm -rf /var/lib/apt/lists/* 

##############################
# Install tflint             #
##############################
RUN curl https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
##############################
# Install terrascan          #
##############################
RUN curl --location https://github.com/accurics/terrascan/releases/download/v1.4.0/terrascan_1.4.0_Linux_arm64.tar.gz --output terrascan.tar.gz \
    && tar -xvf terrascan.tar.gz \
    && install terrascan /usr/local/bin
##############################
# Install tfenv              #
##############################
RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv \
    && ln -s ~/.tfenv/bin/* /usr/local/bin

COPY ci.sh /app/ci.sh
RUN ["chmod", "+x", "/app/ci.sh"]

WORKDIR /data

ENTRYPOINT ["/app/ci.sh"]