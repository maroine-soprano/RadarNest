# 🛰️ RadarNest

**RadarNest** is your all-in-one marketing analytics platform, designed to uncover trends, empower strategy, and drive data-led decisions. With intuitive dashboards, a powerful query builder, and a personalized AI assistant, RadarNest gives marketers the tools they need to make smarter choices with confidence.

---

## 🧑‍💻 Tech Stack

- **Frontend**: Angular -> https://github.com/maroine-soprano/RadarNest-Front-github
- **Backend**: Node.js, Nest JS, GraphQL -> https://github.com/maroine-soprano/RadarNest-backend-github
- **AI Engine**: LLama cpp, Mistral model, FastAPI
- **Database**: MongoDB
- **Visualization**: Chart.js
- **Tools**: Docker

---

## 🚀 Features

### 🔐 Authentication
- **Log In / Sign Up**: Secure login and account creation using username and password.

---

### 📊 Analytics Dashboard – **AnalytiCAT**
AnalytiCAT dashboard provides insights into key marketing performance metrics with clean and interactive visualizations.

---

### 🔍 Query Builder – **Query builDOG**
Query builDOG helps you build customized queries using a wide variety of attributes:

- 🎛️ **Drag and drop interface** to move attributes between Available and Selected.
- 🔍 allowing you to select from a wide range of attributes to craft highly customized queries.

---

### 🤖 AI Assistant – **Roarketing Strategist**
Get AI-generated strategy recommendations tailored to your audience and context.

- 📱 Device type, brand, and model
- 🌍 Country
- 🌡️ Temperature
- 📢 Ad Platform

---

## 🛠️ Getting Started

Follow these steps to set up and launch the RadarNest project on your machine:

### 🔧 Prerequisites

Make sure you have the following tools installed:

- [Git]
- [Make]
- [Docker]
- [Python 3.10+](https://www.python.org/)

> 💡 If `make` is not installed:
- **macOS**: `brew install make`
- **Windows**: `choco install make`

---

### 🚀 Installation & Launch

```bash
# 1. Clone the repository
git clone https://github.com/maroine-soprano/RadarNest.git

# 2. Navigate into the project folder
cd RadarNest

# 3. Download the Mistral LLM model (used for generating AI strategies)
make download-model

# 4. Launch the full stack (MongoDB, backend, frontend, LLM via llama.cpp, FastAPI)
make up

# 5. Load sample marketing data into MongoDB
make load-data```
```

---

### 🧠 What Each Step Does

- `make download-model`:  
  Downloads the **Mistral LLM** model, which powers the AI assistant that generates personalized marketing strategies.

- `make up`:  
  Spins up the **entire application stack**. This includes:

  - 🐍 **Sets up the Python environment**:  
    Creates a virtual environment and installs all required dependencies from `requirements.txt`.

  - 🐳 **Starts Docker containers**:  
    Uses Docker Compose to launch:
    - A **MongoDB** container with an initialized database
    - A **NestJS backend** container (from a remote image)
    - An **Angular frontend** container (from a remote image)

- `make load-data`:  
  Loads predefined JSON data into MongoDB to populate the platform with user data.

--

### 🧪 Verifying Setup

Once the stack is running:

- Open your browser and go to: [http://localhost:4200]
