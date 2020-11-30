FROM nginx:alpine
LABEL author="Faisal Al-Zaben"

WORKDIR /usr/share/nginx/html
COPY index.html /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# Run using: docker run –d -p 8080:80 -v [currentWorkingDirectory]:/usr/share/nginx/html nginx:alpine