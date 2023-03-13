# Stage 1: Build frontend
FROM node:alpine as frontend-build
WORKDIR /crictrix/frontend
COPY frontend/package*.json ./
COPY frontend/ .
RUN npm ci && npm run build --prod

# Stage 2: Build backend
FROM gradle:8.0.2 as backend-build
WORKDIR /crictrix/webapp
COPY webapp/ .
RUN gradle build --no-daemon

# Stage 3: Create final image
FROM adoptopenjdk:15-jdk-hotspot-focal as runtime
WORKDIR /crictrix
COPY --from=frontend-build /crictrix/frontend/dist/crictrix ./static
COPY --from=backend-build /crictrix/webapp/build/libs/webapp-0.0.1-SNAPSHOT.jar ./webapp-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "webapp-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080