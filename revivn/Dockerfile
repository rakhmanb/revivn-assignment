# Use the official Ruby image as the base image
FROM ruby:2.7.4

# Set the working directory in the container
WORKDIR /app

# Install essential dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    yarn

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN gem install bundler && bundle install

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the Rails application
CMD rails db:setup && rails server -b 0.0.0.0
