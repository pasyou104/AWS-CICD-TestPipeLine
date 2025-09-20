# 아주 가벼운 Nginx 이미지로 정적 페이지 + 헬스엔드포인트 제공
FROM nginx:alpine

# Health endpoint (/health) 200 OK 반환
RUN printf 'server {\n\
    listen 80;\n\
    server_name _;\n\
    location /health { return 200 "ok"; add_header Content-Type text/plain; }\n\
    location / { root /usr/share/nginx/html; index index.html; }\n\
}\n' > /etc/nginx/conf.d/default.conf

# 기본 index.html (원하면 리포의 index.html로 대체 가능)
RUN echo "<html><body><h1>Deployed via CodeDeploy</h1></body></html>" > /usr/share/nginx/html/index.html
