# 1. 기반 이미지 선택
# pom.xml에서 Java 버전을 17로 확인했으므로, Java 17이 설치된 이미지를 사용합니다.
FROM eclipse-temurin:17-jdk-jammy

# 2. 컨테이너 내부의 작업 폴더 설정
# 앞으로의 모든 작업은 컨테이너 안의 /app 폴더에서 이루어집니다.
WORKDIR /app

# 3. 빌드된 .jar 파일 복사
# Maven은 'target' 폴더에 빌드 결과물을 만듭니다.
# 'target/*.jar'를 사용하여 생성된 .jar 파일을 컨테이너 안으로 복사하고,
# 'app.jar'라는 통일된 이름으로 사용합니다.
COPY target/*.jar app.jar

# 4. 포트 설정
# Spring Boot 앱이 8080 포트를 사용한다고 외부에 알립니다.
EXPOSE 8080

# 5. 애플리케이션 실행
# 컨테이너가 시작될 때 "java -jar app.jar" 명령어를 실행하여 서버를 구동합니다.
ENTRYPOINT ["java","-jar","app.jar"]