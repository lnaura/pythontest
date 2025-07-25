FROM python:3.11-slim

RUN apt-get update
RUN apt-get install -y --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 5000
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]