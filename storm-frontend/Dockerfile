FROM node:latest

WORKDIR /stormrider-frontend

COPY package*.json /stormrider-frontend/

RUN npm install

COPY . /stormrider-frontend/

EXPOSE 3000
CMD ["npm","start"]