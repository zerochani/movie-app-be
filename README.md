# 🎬 영화 정보 API 서버 (Movie API Backend)

React 기반의 영화 정보 및 리뷰 웹 애플리케이션을 위한 Spring Boot 기반 RESTful API 백엔드 서버입니다. MongoDB를 데이터베이스로 사용하며, Render와 Docker를 통해 배포되었습니다.

---

## ✅ 라이브 API 서버
이 서버는 Render에 배포되어 있으며, 아래의 기본 주소(Base URL)를 통해 실시간으로 접근할 수 있습니다.

🔗 https://my-movie-app-okv0.onrender.com

### 주요 엔드포인트 예시
- **전체 영화 목록 조회**  
  GET https://my-movie-app-okv0.onrender.com/api/v1/movies
- **특정 영화 상세 정보 조회**  
  GET https://my-movie-app-okv0.onrender.com/api/v1/movies/tt8093700

---

## 🚀 주요 기능
- **영화 정보 제공:** 전체 영화 목록 및 IMDb ID 기반의 상세 정보 조회 기능 제공
- **리뷰 관리:** 각 영화에 대한 사용자 리뷰 생성 및 조회 기능
- **클라우드 배포:** Docker 컨테이너화하여 Render 플랫폼에 배포

---

## 📖 API 명세 (Endpoints)
| Method | Endpoint | 설명 |
|--------|-------------------------------|------------------------------|
| GET    | /api/v1/movies                | 전체 영화 목록 조회           |
| GET    | /api/v1/movies/{imdbId}       | imdbId에 해당하는 영화 상세 조회 |
| POST   | /api/v1/reviews               | 새로운 리뷰 작성              |


---

## 🛠️ 기술 스택
| 구분     | 기술                |
|----------|---------------------|
| 언어     | Java 17             |
| 프레임워크 | Spring Boot 3.5.0   |
| 데이터베이스 | MongoDB (Atlas)    |
| 빌드 도구 | Maven               |
| 배포     | Render, Docker       |

---

## ⚙️ 시작하기 (Getting Started)
### 1. 사전 요구사항
- Java 17 (JDK)
- Maven
- MongoDB Atlas 계정

### 2. 로컬 환경에서 실행하기
```bash
# 1. 저장소를 클론합니다.
git clone https://github.com/zerochani/movie-app-be.git
cd movie-app-be

# 2. .env 파일을 생성하고 MongoDB 연결 정보를 입력합니다.
# (루트 디렉토리에 .env 파일을 만드세요)
# MONGO_URI=mongodb+srv://<username>:<password>@<cluster-url>/<dbname>

# 3. 애플리케이션을 실행합니다.
# Windows
./mvnw.cmd spring-boot:run

# macOS / Linux
./mvnw spring-boot:run
```
서버가 성공적으로 실행되면 http://localhost:8080 에서 접근할 수 있습니다.

---

## 🧩 향후 개발 로드맵
- [ ] 인증/인가: JWT 기반의 회원가입 및 로그인 기능 추가
- [ ] 리뷰 기능 확장: 리뷰 작성 시 별점(Star Rating) 기능 추가
- [ ] 사용자 기능: 유저별 리뷰 관리(조회/수정/삭제) 기능
- [ ] 데이터 분석: 영화 평점 평균 계산 및 정렬 기능

---