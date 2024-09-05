# Use the Debian base image
FROM debian:latest

# Install required packages and MySQL
RUN apt-get update && \
    apt-get install -y \
    wget \
    lsb-release \
    gnupg && \
    wget https://dev.mysql.com/get/mysql-apt-config_0.8.20-1_all.deb && \
    dpkg -i mysql-apt-config_0.8.20-1_all.deb && \
    apt-get update && \
    apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

# Copy the credentials file into the container
COPY mysql_credentials.txt /mysql_credentials.txt

# Source the credentials and set MySQL root password in the environment
RUN export $(grep -v '^#' /mysql_credentials.txt | xargs)

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

# Expose the default MySQL port
EXPOSE 3306

# Run MySQL server with the configuration and root password
CMD ["bash", "-c", "service mysql start && mysqladmin -u root password $MYSQL_ROOT_PASSWORD && tail -f /dev/null"]
