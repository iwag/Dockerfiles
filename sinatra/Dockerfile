FROM ruby:2.3-slim
WORKDIR /app
ADD . /app

# Install any necessary dependencies
RUN bundle install --path vendor/bundle

# Open port 80 for serving the webpage
#EXPOSE 8080

# Run app.py when the container launches
CMD ["bundle", "exec", "ruby", "app.rb"]

