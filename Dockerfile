FROM drupal:7

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y sqlite unzip && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*

# Install Composer.
ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_NO_INTERACTION=1 \
    PATH="/root/.composer/vendor/bin:$PATH"
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Install Drush globally.
RUN composer g require "hirak/prestissimo" && \
    composer g require "drush/drush":"8.1.x"
