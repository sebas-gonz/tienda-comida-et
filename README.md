# 🍔🍕 Burger & Pizza Hub - Evaluación Transversal DevOps

Repositorio del proyecto final para la asignatura **Introducción a herramientas DevOps** (Duoc UC). 

Este proyecto demuestra la implementación de una arquitectura de microservicios de tres capas (Frontend, Backend, Base de Datos) desplegada en la nube utilizando **Amazon EKS (Elastic Kubernetes Service)** y un flujo de trabajo automatizado de **CI/CD** con GitHub Actions.

---

## 🛠️ Tecnologías y Stack

**Aplicación:**
* **Frontend:** HTML5, CSS3, Vanilla JavaScript (NGINX para el contenedor).
* **Backend:** Node.js, Express.js.
* **Testing:** Jest (Pruebas unitarias y de validación de endpoints).
* **Base de Datos:** MySQL.

**Infraestructura y DevOps:**
* **Contenedores:** Docker.
* **Registro de Imágenes:** Amazon ECR (Elastic Container Registry).
* **Orquestación:** Kubernetes (Amazon EKS).
* **CI/CD:** GitHub Actions.
* **Observabilidad:** Amazon CloudWatch (Métricas de consumo EC2).

---

## ☁️ Arquitectura Cloud (AWS)

La infraestructura fue diseñada bajo principios de alta disponibilidad y el modelo de seguridad de menor privilegio:

* **Red Segura (VPC):** Se implementó una VPC en la región `us-east-1` con múltiples Zonas de Disponibilidad.
* **Subredes Privadas (Aislamiento):** Los nodos de trabajo (Worker Nodes `t3.medium`) que alojan los pods de la aplicación y la base de datos se ubican en subredes privadas, protegiéndolos del acceso directo desde Internet.
* **Subredes Públicas (Acceso Controlado):** Se configuró un **Application Load Balancer** en las subredes públicas para recibir el tráfico de los clientes y enrutarlo de forma segura hacia el Frontend en la red privada.
* **NAT Gateway:** Permite que los nodos en la red privada tengan tráfico de salida hacia Internet para descargar imágenes desde Amazon ECR, bloqueando cualquier conexión entrante no deseada.

---

## 🚀 Pipeline CI/CD (GitHub Actions)

El despliegue está completamente automatizado a través de `.github/workflows/deploy-eks.yml`. Cada vez que se realiza un push a la rama `main`, se ejecuta el siguiente flujo:

1. **Checkout del Código:** Descarga la última versión del repositorio.
2. **Quality Gate (Testing):** Ejecuta `npm test` con Jest en el Backend. Si una prueba falla, el pipeline se detiene y envía una alerta por correo electrónico.
3. **Build & Push:** Si las pruebas son exitosas, construye las imágenes Docker (Frontend, Backend, DB) y las sube a Amazon ECR con un tag único.
4. **Despliegue Continuo (Zero Downtime):** Se autentica en Amazon EKS y aplica los manifiestos de Kubernetes (`kubectl apply`), actualizando los despliegues con las nuevas imágenes sin interrumpir el servicio.

---

## 📁 Estructura del Repositorio

* `/frontend`: Código fuente y Dockerfile de la interfaz de usuario.
* `/backend`: Código fuente, pruebas (`server.test.js`) y Dockerfile de la API REST.
* `/db`: Scripts de inicialización y Dockerfile para MySQL.
* `/k8s`: Manifiestos de Kubernetes (Deployments, Services, Secrets) separados por componente.
* `/.github/workflows`: Definición del pipeline de integración y despliegue continuo.

---

**Autor:** Sebastián González
**Institución:** Duoc UC - Ingeniería en Informática
