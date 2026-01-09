Repository contains a Streamlit-based data processing suite designed for seamless data exploration and persistent storage. The project transitions from a standalone data visualization tool to a fully orchestrated multi-container application leveraging PostgreSQL for data persistence.

---

## 🚀 Project Overview

The objective of this project is to provide a production-ready environment for data analysis. It allows users to upload raw datasets, perform instant exploratory data analysis (EDA), and manage data lifecycle through a database backend. 

By containerizing these workflows, we ensure "write once, run anywhere" consistency for the entire team.

### Key Capabilities
* **Instant EDA:** Automatic generation of summary statistics and data previews.
* **Persistent Storage:** Integration with PostgreSQL to save and retrieve processed datasets.
* **Orchestrated Deployment:** One-command setup using Docker Compose to link the application and database.

---

## 📂 File Structure & App Logic

### The `/app` Directory
The core logic resides in the `app/` folder, organized by deployment complexity:

* **`data_process.py`**: The baseline application. It handles local CSV uploads and performs in-memory analysis (ideal for quick local testing).
* **`data_process_db.py`**: The production-tier application. It includes the logic to connect to a PostgreSQL instance, load data into tables, and query them back for display.
* **`student.csv`**: A standardized sample dataset. **Use this file to test the application's upload and database ingestion pipelines.**

### Infrastructure
* **`Dockerfile`**: Defines the Python environment, dependencies, and Streamlit configurations.
* **`docker-compose.yml`**: Manages the multi-container network, environment variables, and volumes for the app and the PostgreSQL database.

---

## 🛠️ Getting Started

### 1. Standalone Mode (Streamlit Only)
To run the basic data processing app without a database:
```bash
docker build -t streamlit-app .
docker run -p 8501:8501 --name <container_name> streamlit-app
```

### 2. Full Stack Mode (Streamlit + PostgreSQL + pgAdmin)

This mode orchestrates the primary application logic alongside a persistent PostgreSQL database and a web-based administration interface (**pgAdmin**) for real-time data monitoring and management.

To launch the complete environment:
```bash
docker-compose up
```

### 3. Service Access

Once the containers are initialized, the following services will be available:

- Streamlit Application: http://localhost:8501 — The primary interface for data processing, CSV uploads, and visualization.

- pgAdmin GUI: http://localhost:8080 — A web interface to manage the PostgreSQL instance. Use this to verify that data ingested via data_process_db.py is correctly stored in your tables.
