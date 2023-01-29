FROM python:3.9

RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /app
COPY . .
RUN python manage.py migrate

EXPOSE 8001
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]

