#!/bin/bash
echo "Installing packages using Composer..."
composer install --no-scripts --no-autoloader --ignore-platform-reqs

echo "Running Composer dump-autoload..."
composer dumpautoload

# Set permissions
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

echo "Checking if the storage link exists..."
if [ -L /var/www/html/public/storage ]; then
    echo "Storage link already exists. Skipping..."
else
    echo "Linking storage..."
    php artisan storage:link
fi

echo "Starting PHP-FPM..."
php-fpm
