FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
RUN apt-get install -y ruby-dev sqlite3 libsqlite3-dev nodejs
RUN apt-get install -y tzdata
RUN gem install rails
RUN rails new hello
WORKDIR /hello
EXPOSE 80

CMD ["./bin/rails", "server", "-p", "80", "-b", "0.0.0.0"]
