# Use official Python image
FROM python:3.10-slim

# Set work directory
WORKDIR /app

# Copy files
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose port
EXPOSE 8000

# Start the service
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]