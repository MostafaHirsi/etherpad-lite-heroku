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
  Libreoffice \
  pandoc \
  && rm -rf /var/lib/apt/lists/*

RUN wget http://binaries.html-tidy.org/binaries/tidy-5.2.0/tidy-5.2.0-64bit.deb
sudo dpkg -i tidy-5.2.0-64bit.deb


# Add our code
ADD ./ /opt/etherpad/
WORKDIR /opt/etherpad

# Install dependencies and run code

# Expose is NOT supported by Heroku # EXPOSE 5000 		


# Run the image as a non-root user
RUN useradd -m myuser
USER myuser


RUN ls
RUN which pandoc
RUN pwd
RUN echo DATABASE_URL
RUN echo PORT
RUN which libreoffice
RUN which tidy

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku

 
CMD exec ./preparse.rb
