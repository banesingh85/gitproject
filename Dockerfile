# -----------------------------
# 1. Use official Node image
# -----------------------------
FROM node:18-alpine

RUN apk add --no-cache \
    libc6-compat \
    vips-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    build-base \
    python3

# -----------------------------
# 2. Set working directory
# -----------------------------
WORKDIR /app

# -----------------------------
# 3. Copy package files first
#    (Better caching for CI/CD)
# -----------------------------
COPY package*.json ./

# -----------------------------
# 4. Install dependencies
# -----------------------------
RUN npm install --production

# -----------------------------
# 5. Copy application source
# -----------------------------
COPY . .

# -----------------------------
# 6. Expose the app port
# -----------------------------
EXPOSE 3000

# -----------------------------
# 7. Start the app
# -----------------------------
CMD ["npm", "start"]
