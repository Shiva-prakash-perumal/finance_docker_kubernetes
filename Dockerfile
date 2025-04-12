# Base Python image
FROM python:3.8-slim

# Install necessary Python dependencies
RUN pip install boto3 requests

# Copy both scripts (ingestion and transformation)
COPY data_load_to_s3.py /app/data_load_to_s3.py
COPY data_transform.py /app/data_transform.py

# Set the working directory
WORKDIR /app

# Default command to execute both scripts sequentially
CMD ["sh", "-c", "python data_load_to_s3.py && python data_transform.py"]