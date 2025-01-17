# Weather Data Management and Visualization Application

This project creates a Spring Boot application that manages weather data for various locations, scrapes data from the OpenWeatherMap API, stores it in a MySQL database, and visualizes it using Grafana. The application is containerized with Docker, and a CI/CD pipeline is set up for automated builds and deployments.

## Features

- **Spring Boot REST APIs** for managing locations and fetching weather data.
- **Scheduled task** that pulls weather data from OpenWeatherMap every hour.
- **MySQL database** for storing weather data.
- **Grafana integration** for visualizing weather data on a Geo Map panel.
- **Dockerization** of the application and database services.
- **CI/CD pipeline** using Jenkins to automate builds, security scans, and Docker image pushes.

## Technologies Used

- **Spring Boot**: Backend framework
- **MySQL**: Database
- **Grafana**: Data visualization
- **Docker**: Containerization
- **Jenkins**: CI/CD automation
- **OpenWeatherMap API**: Weather data source

## Setup

1. Clone the repository.
2. Build and run the application with Docker Compose:
   ```bash
   docker-compose up --build