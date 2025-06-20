# 🏋 Karate Chapter Evaluación - Marvel Heroes API

## 💼 Author

**Nombre:** *\Rein Obregon*

---

## 📖 Descripción

Este proyecto forma parte de una evaluación práctica utilizando **Karate DSL** para realizar pruebas de API sobre el sistema de **Marvel Heroes**.

Incluye escenarios de prueba para:

* Crear héroes
* Consultar héroes por ID
* Actualizar información de héroes
* Manejo de errores como ID duplicado o no encontrado
* Eliminar Heroes

---

## 📁 Estructura del proyecto

```
karate-marvel-api/
├── build.gradle
├── src/
│   └── test/
│       ├── java/
│       │   └── features.marvel.heroes/
│       │        ├── create/
│       │        ├── update/
│       │        ├── delete/
│       │        ├── find/ 
│       │        └── MarvelHeroesTest.java
│       └── resources/
│           └── data/
│               ├── create/
                ├── update/
│               ├── delete/
│               ├── find/  
└── README.md
```

---

## ▶️ Cómo ejecutar las pruebas

### 🪠 Windows (CMD)

```bash
gradlew test -Dkarate.env=dev
```

> 📝 Asegúrate de usar `cmd` y no PowerShell si ves que las variables no funcionan correctamente.

---

### 🐧 Linux / macOS

```bash
./gradlew test -Dkarate.env=dev
```

> ⚠️ Asegúrate de que el archivo `gradlew` tenga permisos de ejecución (`chmod +x gradlew` si es necesario).





## 📦 Requisitos

* Java 11 o superior
* Gradle 7 o superior
* IntelliJ IDEA (opcional, para correr desde la UI)
* Conexión a Internet (si usas endpoints públicos)

---

## 📄 Notas

* Los archivos `.json` usados para solicitudes y respuestas esperadas se encuentran bajo `src/test/resources/data/`.
* El reporte de resultados se encuentra en:
  `build/reports/tests/test/index.html`
* Las configuraciones por entorno se definen en `karate-config.js`.

---

## ✨ Créditos

Proyecto construido con 💥 usando [Karate DSL](https://github.com/karatelabs/karate) por *Rein Obregon*.
