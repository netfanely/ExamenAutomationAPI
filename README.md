# ExamenAutomationAPI
Examen Técnico: Automatización de API - Restful Booker

Este repositorio contiene la solución al examen técnico de automatización de APIs utilizando Karate Framework. 

🚀 Endpoints Automatizados

Se implementaron casos de prueba Happy y Unhappy Path para los siguientes recursos:

    Auth - CreateToken 

    Booking - GetBooking 

    Booking - UpdateBooking 

🛠️ Requisitos

    Java JDK 8 o superior.

    Maven 3.6+ (para la gestión de dependencias y ejecución).

📂 Estructura del Proyecto

    src/test/java: Contiene los archivos .feature con los escenarios de prueba en lenguaje Gherkin.

    karate-config.js: Configuración global de la URL base (https://restful-booker.herokuapp.com).

    pom.xml: Dependencias del framework Karate y JUnit.

🧪 Ejecución de Pruebas

Para correr los tests, ejecuta el siguiente comando en la terminal:
Bash

mvn test

📊 Reportes

Una vez finalizada la ejecución, Karate genera reportes detallados en formato HTML que puedes encontrar en:
target/karate-reports/karate-summary.html

Detalles de la entrega 

    Candidato: Fanny Pastor

    Fecha de entrega: 23/02/2026 

    Contacto de revisión: Joan Tasayco
