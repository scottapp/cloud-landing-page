FROM ubuntu:20.04 as page-build
RUN apt update
# We directly answer the questions asked using the printf statement
RUN printf 'y\n1\n\1n' | apt install nodejs
RUN apt install -y npm
RUN apt install -y nginx
RUN apt install -y gettext-base

WORKDIR /app
COPY . ./
RUN npm install
RUN npm run build

COPY nginx.conf /etc/nginx/conf.d/configfile.template
ENV PORT 8080
ENV HOST 0.0.0.0
RUN sh -c "envsubst '\$PORT'  < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf"
RUN cp -r /app/build/* /usr/share/nginx/html/.
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
