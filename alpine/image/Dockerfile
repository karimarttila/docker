FROM alpine:3.8

# A couple of packages to debug Docker image.
# You can comment these later when creating the final image.
RUN apk update && apk add ca-certificates emacs
RUN apk add --no-cache curl

# Set MY_LIB_DIR - you can copy there your app in derived images.
ENV MY_LIB_DIR /opt/mylib

RUN mkdir -p $MY_LIB_DIR

RUN printf "#!/bin/sh\necho \"You should provide your own startup script in application Docker image!\"\n" > ./my-entrypoint.sh
RUN chmod +x ./my-entrypoint.sh
ENTRYPOINT ["./my-entrypoint.sh"]
