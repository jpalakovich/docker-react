FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# /app/build <-- contains the files necessary to run the web app

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
