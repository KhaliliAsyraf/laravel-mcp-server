FROM php:8.3-fpm-bullseye

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    build-essential \
    curl \
    git \
    gnupg2 \
    libltdl7 \
    libonig-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    locales \
    locales-all \
    unzip \
    zip \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    exif \
    gd \
    mbstring \
    pcntl \
    pdo_pgsql \
    xml \
    zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.8.4

# Set working directory
WORKDIR /var/www/html

# Copy the run.sh script
COPY run.sh /var/www/html/run.sh

# Set execute permissions for the run.sh script
RUN chmod +x /var/www/html/run.sh

CMD ["bash", "./run.sh"]
