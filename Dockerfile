# Use Ubuntu as base image
FROM ubuntu:bionic

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install Golang 1.17
RUN wget -qO- https://golang.org/dl/go1.17.linux-amd64.tar.gz | tar xz -C /usr/local
ENV PATH=$PATH:/usr/local/go/bin

# Copy the entire current directory into the Docker image
WORKDIR /
COPY . .

# Build the Go application
RUN go build -o /app/bin/organize

CMD ["/app/bin/organize","/organize"]

