FROM node:latest as build

WORKDIR /app
COPY . .

RUN npm install -g @angular/cli
RUN npm install
RUN ng build 

FROM nginx:alpine
COPY --from=build /app/dist/* /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]