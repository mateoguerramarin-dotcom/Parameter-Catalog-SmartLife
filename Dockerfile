# ==========================================
# Etapa 1: construir el jar con el wrapper de Maven
# ==========================================
FROM eclipse-temurin:25-jdk AS build
WORKDIR /app

COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Por si Windows dejo saltos de linea que Linux no entiende
RUN sed -i 's/\r$//' ./mvnw && chmod +x ./mvnw

COPY src src
RUN ./mvnw -B clean package -DskipTests

# ==========================================
# Etapa 2: ejecutar
# ==========================================
FROM eclipse-temurin:25-jre-alpine
RUN addgroup -S smartlife && adduser -S smartlife -G smartlife
WORKDIR /app
COPY --from=build /app/target/parameter-catalog.jar app.jar
USER smartlife
EXPOSE 8080
ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75", "-jar", "app.jar"]