# 1. Dockerfile.python
cat <<'EOF' > Dockerfile.python
FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
EOF

# 2. .dockerignore
cat <<'EOF' > .dockerignore
.git
__pycache__
*.pyc
.env
venv
.idea
.vscode
EOF

# 3. .gitignore
cat <<'EOF' > .gitignore
.env
venv
__pycache__
.idea
.vscode
EOF

# 4. Проверяем, что файлы созданы
ls -la Dockerfile.python .dockerignore .gitignore

# 5. Собираем образ для проверки
docker build -f Dockerfile.python -t example-python .
