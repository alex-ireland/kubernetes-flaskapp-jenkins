FROM python:3.6

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 5500

ENTRYPOINT ["python", "app.py"]
