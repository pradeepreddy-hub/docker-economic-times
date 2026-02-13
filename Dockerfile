FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:10.1-jre17-temurin
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/
