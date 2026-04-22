FROM eclipse-temurin:17-jdk AS build

WORKDIR /workspace

COPY gradlew gradlew
COPY gradle gradle
COPY build.gradle settings.gradle ./
COPY src src

RUN chmod +x ./gradlew && ./gradlew clean bootJar --no-daemon
RUN find build/libs -name "*.jar" ! -name "*plain.jar" -exec cp {} /tmp/app.jar \;

FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=build /tmp/app.jar app.jar

EXPOSE 8088

ENTRYPOINT ["java", "-jar", "app.jar"]
