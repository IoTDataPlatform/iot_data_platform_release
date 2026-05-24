FROM eclipse-temurin:17-jre

WORKDIR /app

COPY temp-enricher.jar /app/temp-streams-enricher.jar
COPY temp-enricher.properties /app/temp-enricher.properties

CMD ["java", "-jar", "/app/temp-streams-enricher.jar", "/app/temp-enricher.properties"]
