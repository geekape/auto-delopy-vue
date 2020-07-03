FROM node
WORKDIR /app

COPY package*.json ./
RUN npm i
COPY ./ /www/wwwroot/vue-test
RUN npm run build:prod

FROM nginx
RUN mkdir /app
COPY --from=0 /www/wwwroot/vue-test/dist /www/wwwroot/vue-test
COPY nginx.conf /etc/nginx/nginx.conf

