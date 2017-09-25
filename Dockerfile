# get existing image to extend
FROM node:latest

#install packages
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  gzip \
  git-core \
  libssl-dev \
  pkg-config \
  python \
  ruby \
  supervisor \
  Libreoffice \
  pandoc \

  && rm -rf /var/lib/apt/lists/*


# Add our code
ADD ./ /opt/etherpad/
WORKDIR /opt/etherpad

# Install dependencies and run code

# Expose is NOT supported by Heroku # EXPOSE 5000 		

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
ENV PORT $PORT
RUN exec preparse.rb
