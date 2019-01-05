ARG base_tag
FROM karimarttila/alpine3.8:$base_tag

# Install OpenJDK8 - Clojure app needs it.
RUN apk --update add openjdk8-jre

# Set MY_LIB_DIR - You can use this directory for copying derived image files.
ENV MY_LIB_DIR /opt/mylib

RUN mkdir -p $MY_LIB_DIR

RUN printf "#!/bin/sh\necho \"You should provide your own startup script in application Docker image!\"\n" > ./my-entrypoint.sh
RUN chmod +x ./my-entrypoint.sh
ENTRYPOINT ["./my-entrypoint.sh"]
