# Use an official Python runtime as a parent image
FROM python:3.13-slim

# Update and install security packages
RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Set the PYTHONPATH to include the src directory
ENV PYTHONPATH="/app/src"

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 8000

# Define environment variables
ENV MSSQL_SERVER=localhost
ENV MSSQL_USER=user_name
ENV MSSQL_PASSWORD=your_password
ENV MSSQL_DATABASE=your_database
ENV MSSQL_PORT=1433

# Run the application
CMD ["python", "-m", "mssql_mcp_server.server"]