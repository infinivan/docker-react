
#builder is the name of the reference for the run phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#need to copy over /app/build
RUN npm run build

#FROM terminates each successive block
FROM nginx
#builder is the reference to the node container
COPY --from=builder /app/build /usr/share/nginx/html
#we dont need to run anything to start up nginx (nginx daaemon is automatically run)