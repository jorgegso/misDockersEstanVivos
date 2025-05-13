# 🐳 Docker Container Status Checker

> Bash script to check which Docker containers are running, what ports they expose, and generate accessible URLs — in both English and Spanish.

---

## 🇬🇧 English

### 🚀 Features

- Lists all **running Docker containers**.
- Shows:
  - ✅ Container name
  - ✅ Mapped ports
  - ✅ Generated access URL
- If mapped to `localhost`, it uses `http://localhost:<port>`.
- If mapped to an internal IP, it uses `http://<ip>:<port>`.
- Shows containers with or without exposed ports.

### ✅ Requirements

- Docker installed and running.
- Bash shell (Linux/macOS or Git Bash for Windows).

### 📦 Installation


git clone https://github.com/your_username/docker-container-status-checker.git
cd docker-container-status-checker
chmod +x misDockersEstanVivos.sh
🧪 Usage
Run the script:


./misDockersEstanVivos.sh
Example output:


🟢 Container: ollama, Ports: 0.0.0.0:11434->11434/tcp, URL: http://localhost:11434
🟢 Container: n8n, Ports: 0.0.0.0:5678->5678/tcp, URL: http://localhost:5678
Output Explained
🟢 → Container is online.

Container → Docker container name.

Ports → Published/mapped ports.

URL → Web-accessible address.

🤝 Contributing
Feel free to fork and submit pull requests with improvements or additional features.

📄 License
Licensed under the MIT License.
