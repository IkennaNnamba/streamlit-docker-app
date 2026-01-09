# Use the official Python image from the Docker Hub as a base image
FROM python:3.14.2-slim-bookworm

# Set the working directory in the container
WORKDIR /streamlit_app

# Copy and install the required Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY app .

# Expose the port that Streamlit will run on
EXPOSE 8501

# Set the command to run the Streamlit application
CMD ["streamlit", "run", "./data_process.py"]