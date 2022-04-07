FROM ruby:3.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -qq
RUN apt install -y build-essential yarn
WORKDIR /app
COPY . .
RUN bundle install
RUN yarn install
RUN gem install foreman

# # Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
# CMD ["bundle","exec","rails","server","-b","0.0.0.0","-p","3000”]
CMD ["bin/dev"]



# ## Docker commands to setup app
# docker-compose build
# docker-compose run app bin/rails tailwindcss:install
# docker-compose run app bin/rails javascript:install:esbuild
# docker-compose up

# ## In seperate terminal
# docker-compose run app rake db:create
# docker-compose run app rake db:migrate
# docker-compose run app rake db:seed 
# docker-compose down

# From here on out you can run 
# docker-compose up
# or 
# docker-compose down
