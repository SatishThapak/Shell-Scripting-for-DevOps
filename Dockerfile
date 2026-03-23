# Use official Apache image
FROM httpd:2.4

# Copy custom HTML into the default web directory
COPY ./index.html /usr/local/apache2/htdocs/

