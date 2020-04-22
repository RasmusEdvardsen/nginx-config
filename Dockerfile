FROM nginx:stable-alpine

COPY kraeja.conf storage.kraeja.conf portfolio.kraeja.conf /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
