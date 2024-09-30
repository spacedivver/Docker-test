FROM node:20-alpine

# 루트 경로의 'app'이라는 폴더안에 프로젝트 관련 파일들을 복사하겠다고 명시
WORKDIR /app
# WORKDIR은 유닉스 명령어에서 cd와 같은 개념

# 빈번히 변경되는 파일일 수록 마지막에 작성하는 것이 좋음

# 이 명령어는 Dockerfile에서 사용하는 COPY 명령어로,
# 로컬 시스템에 있는 package.json 파일과 package-lock.json 파일을 
# Docker 이미지의 현재 작업 디렉토리(./)로 복사하는 것을 의미합니다.

# ./는 WORKDIR 명령어로 경로를 지정하지 않으면, 루트 디렉토리(/)를 지정한다.
# ./은 /app 디렉토리를 의미
COPY package.json package-lock.json ./

# package.json에 명시된 모든 라이브러리들을 설치함
# RUN npm install
# package.json에서 특정 라이브러리의 버전 3이상의 버전은 다 괜찮다고 명시하면
# 실행 당시 최신 버전이 나왔다면 그 버전이 설치됨
# 프로젝트를 개랍ㄹ한 버전과 실제 설치한 버전이 달라질 수 있음

# package.json에 명시된 버전을 설치함으로써, 버전이 달라질 수 있는 이슈를 해결가능
RUN npm ci

COPY index.js .

# node라는 명령어를 실행할 것이고, index.js라는 파일을 실행하라는 의미
ENTRYPOINT [ "node", "index.js" ]