FROM maven:3.6-jdk-11-slim as BUILD
COPY ./src
WORKING /src

RUN echo «Hello from me!!»