# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the source code into the container
COPY . /app/

ENV MLFLOW_TRACKING_URI="http://localhost:5001"
# RUN python3 "./src/model_predictor.py" --config-path "./data/model_config/phase-1/prob-1/model-1.yaml" --port "8000"

CMD ["python3", "src/model_predictor.py", "--config-path", "data/model_config/phase-1/prob-1/model-1.yaml", "--port", "8000"]
