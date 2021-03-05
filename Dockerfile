FROM python:3.8-slim

# Install requirements.
COPY ./requirements /app/requirements
WORKDIR /app/requirements/
RUN pip3 install --no-cache-dir -r production.txt

# Run app.
COPY ./main.py /app/main.py
WORKDIR /app/
EXPOSE 80
CMD [ "gunicorn", "--bind", "0.0.0.0:80", "main:app" ]
