# Use an official Ruby runtime as a parent image
FROM ruby:3.1.2

# Set the working directory in the container
WORKDIR /app

# Install Bundler 2.3.6
RUN gem install bundler:2.3.6

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs

# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies using bundler
RUN bundle install

# Copy the current directory contents into the container at /app
COPY . .

# Expose the port the Rails app runs on
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]