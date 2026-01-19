FROM python:3.12-alpine

# Install timezone data (Keep this!)
RUN apk add --no-cache tzdata

# Set working directory
WORKDIR /app

# IMPORTANT: Ensure python-dotenv is in your requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Make entrypoint executable
RUN chmod +x entrypoint.sh

# Set default environment variables
# Set this to your local TZ so the logs match your watch
ENV TZ="America/Toronto"

# Use our entrypoint script
ENTRYPOINT ["./entrypoint.sh"]
