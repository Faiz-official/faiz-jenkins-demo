# Simple Node.js app example
FROM node:18
WORKDIR /app
COPY . .
RUN echo "Hello, Jenkins!" > index.html
CMD ["cat", "index.html"]

