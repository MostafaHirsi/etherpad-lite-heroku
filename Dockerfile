# get existing image to extend
FROM ubuntu:latest

#install packages
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  wget \
  gzip \
  git-core \
  libssl-dev \
  pkg-config \
  python \
  ruby \
  nodejs \
  libreoffice \
  pandoc \
  pdf2htmlex \
  texlive \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/htacg/tidy-html5/releases/download/5.4.0/tidy-5.4.0-64bit.deb
RUN dpkg -i tidy-5.4.0-64bit.deb
RUN apt-get install -f

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash
RUN apt-get install -y nodejs

# Add our code
ADD ./etherpad-lite /opt/etherpad/etherpad-lite/
ADD ./installPackages.sh /opt/etherpad/
ADD ./package.json /opt/etherpad/
ADD ./preparse.rb /opt/etherpad/
ADD ./settings.json.template /opt/etherpad/
ADD ./.gitignore /opt/etherpad/

WORKDIR /opt/etherpad

# Run the image as a non-root user
RUN useradd -m myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku

# Install dependencies and run code 
#RUN npm install
#RUN cd ./etherpad-lite/src/
#RUN ls -a
#RUN npm install
#RUN cd ../../

CMD exec ./preparse.rb
