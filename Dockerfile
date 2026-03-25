FROM python:3.9-slim
WORKDIR /app
RUN pip install flask
# Use a DOT to copy everything, including subfolders
COPY . . 
EXPOSE 5000
CMD ["python", "app.py"]
