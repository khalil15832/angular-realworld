FROM node:14.20.0

# Create app directory
WORKDIR /working

# Install app dependencies
COPY package*.json ./

RUN npm install --quiet

# Bundle app source
COPY . .

# Generate build
RUN npm run build

# Move into the directory containing the build artifacts
WORKDIR /working/dist/angular-realworld

# Install http-server
RUN npm install -g http-server

# Set PORT environment variable to 4200 for http-server to use
ENV PORT=4200

CMD [ "http-server" ]
