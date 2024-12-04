FROM alpine:3.14
RUN apk add --no-cache bash git vim openssh

ARG GIT_FULL_NAME
ARG GIT_EMAIL
ARG GIT_USERNAME
ARG GIT_PASSWORD
ARG SSH_PRIVATE_KEY

COPY .gitconfig.template /root/.gitconfig
COPY .git-credentials.template /root/.git-credentials

RUN sed -i "s/\${GIT_FULL_NAME}/${GIT_FULL_NAME}/g" /root/.gitconfig && \
    sed -i "s/\${GIT_EMAIL}/${GIT_EMAIL}/g" /root/.gitconfig

# Replace placeholders with actual credentials
RUN sed -i "s/\${GIT_USERNAME}/${GIT_USERNAME}/g" /root/.git-credentials && \
    sed -i "s/\${GIT_PASSWORD}/${GIT_PASSWORD}/g" /root/.git-credentials

RUN git config --global credential.helper store

RUN chmod 600 /root/.git-credentials

# SSH Key:
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
ENV SSH_PRIVATE_KEY=${SSH_PRIVATE_KEY}
RUN echo -e "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa

# Add known hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

ENTRYPOINT ["/bin/bash"]
