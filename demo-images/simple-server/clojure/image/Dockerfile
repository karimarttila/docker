ARG base_tag
FROM karimarttila/debian-openjdk11:$base_tag

# NOTE: No need to set JAVA_HOME since java already in /usr/bin/java
# Set CLASSPATH to point to MY_LIB_DIR which is set by base image.
ENV CLASSPATH $MY_LIB_DIR

COPY app.jar $MY_LIB_DIR
RUN mkdir -p $MY_LIB_DIR/resources
COPY resources/ $MY_LIB_DIR/resources
COPY my-entrypoint.sh .

RUN chmod +x ./my-entrypoint.sh
ENTRYPOINT ["./my-entrypoint.sh"]
