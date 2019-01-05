ARG base_tag
FROM openjdk:11

# Install Emacs.
RUN apt update
RUN apt install -y emacs-nox

# Set MY_LIB_DIR - You can use this directory for copying derived image files.
ENV MY_LIB_DIR /opt/mylib

RUN mkdir -p $MY_LIB_DIR

RUN printf "#!/bin/sh\necho \"You should provide your own startup script in application Docker image!\"\n" > ./my-entrypoint.sh
RUN chmod +x ./my-entrypoint.sh
ENTRYPOINT ["./my-entrypoint.sh"]
