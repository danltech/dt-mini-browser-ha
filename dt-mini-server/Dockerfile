FROM ghcr.io/danltech/dt-mini-browser-server:latest

USER root
# Korrigiert die Rechte auf /data für den User "mini"
RUN mkdir -p /data/debug /data/downloads /data/states \
    && chown -R mini:mini /data
USER mini
