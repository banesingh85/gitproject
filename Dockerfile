FROM node:18

WORKDIR /app

COPY package*.json ./

# Install ALL dependencies (safe)
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
