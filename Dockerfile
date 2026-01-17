#uygulamanın çalışması için JRE
FROM amazoncorretto:17-alpine

#projenin JAR dosyası burada
ARG JAR_FILE=build/libs/*.jar

#projenin JAR halini docker'a kopyala
COPY ${JAR_FILE} my_app.jar

# uygulamanın iç portunu sabitle
EXPOSE 8080

#uygulamayı komutla çalıştır
ENTRYPOINT ["java","-jar","/my_app.jar"]

