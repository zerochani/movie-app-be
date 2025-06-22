# --- 1단계: 빌더(Builder) 스테이지 ---
# Maven과 Java 17(pom.xml 기준)이 모두 포함된 이미지를 사용합니다.
# 이 스테이지의 별명을 'builder'로 지정합니다.
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# 작업 디렉토리를 설정합니다.
WORKDIR /app

# 먼저 pom.xml만 복사합니다. (의존성 캐싱을 위함)
COPY pom.xml .

# pom.xml을 기반으로 모든 의존성을 다운로드합니다.
RUN mvn dependency:go-offline

# 나머지 소스 코드를 모두 복사합니다.
COPY src ./src

# Maven으로 프로젝트를 빌드합니다. 테스트는 건너뛰어 빌드 속도를 높입니다.
# 이 명령어가 성공하면 /app/target/movies-0.0.1-SNAPSHOT.jar 파일이 생성됩니다.
RUN mvn package -DskipTests


# --- 2단계: 최종(Final) 스테이지 ---
# 실제 서버를 실행할 때는 무거운 Maven이나 JDK가 필요 없습니다.
# 가벼운 Java 실행 환경(JRE) 이미지를 사용합니다.
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# 1단계(builder 스테이지)에서 생성된 .jar 파일을 최종 스테이지로 복사해옵니다.
# 그리고 이름을 app.jar로 통일합니다.
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]