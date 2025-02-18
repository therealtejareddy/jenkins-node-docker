# Stage 1: Build the application
FROM node:23 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Stage 2: Serve the application
FROM node:23-alpine

WORKDIR /app

COPY --from=build /app .

EXPOSE 3000

CMD ["npm", "start"]