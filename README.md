# FaunaQroo API

Backend de FaunaQroo construido con NestJS y Prisma para registrar avistamientos de fauna.

## Estado actual del proyecto

- API base de NestJS inicializada.
- Endpoint disponible: `GET /` responde `Hello World!`.
- Esquema Prisma definido para usuarios, especies y avistamientos.
- Migracion inicial ya creada y lista en `prisma/migrations/20260413025043_init`.

## Stack

- Node.js + TypeScript
- NestJS 11
- Prisma 7
- MySQL
- Jest (unit y e2e)

## Requisitos

- Node.js 20+ (recomendado)
- npm 10+ (recomendado)
- MySQL disponible

## Configuracion

1. Instalar dependencias:

```bash
npm install
```

2. Crear archivo `.env` en la raiz del proyecto con la conexion a MySQL:

```env
DATABASE_URL="mysql://usuario:password@localhost:3306/faunaqroo"
PORT=3000
```

## Prisma y migraciones

Este proyecto usa:

- Schema: `prisma/schema.prisma`
- Config Prisma: `prisma.config.ts`
- Carpeta de migraciones: `prisma/migrations`

### Generar cliente Prisma

```bash
npx prisma generate
```

### Aplicar migracion inicial existente

Para un entorno local de desarrollo:

```bash
npx prisma migrate dev
```

Para aplicar migraciones en un entorno tipo despliegue/CI:

```bash
npx prisma migrate deploy
```

### Migracion inicial incluida

La migracion `20260413025043_init` crea:

- Tabla `User`
  - `id` autoincremental (PK)
  - `name`
  - `email` (unico)
  - `password`
  - `created_at`
- Tabla `species`
  - `id` autoincremental (PK)
  - `common_name`
  - `scientific_name`
  - `group`
  - `image_url` (nullable)
  - `created_at`
- Tabla `sightings`
  - `id` autoincremental (PK)
  - `quantity` (default 1)
  - `latitude`
  - `longitude`
  - `observed_at`
  - `status` (default `vivo`)
  - `notes` (nullable)
  - `photo_path` (nullable)
  - `species_id` (FK a `species.id`)

## Correr la aplicacion

```bash
# desarrollo
npm run start:dev

# produccion
npm run build
npm run start:prod
```

La API queda disponible por defecto en:

- `http://localhost:3000`

## Scripts utiles

```bash
npm run build
npm run lint
npm run format
npm run test
npm run test:e2e
npm run test:cov
```

## Estructura principal

```text
src/
  main.ts
  app.module.ts
  app.controller.ts
  app.service.ts

prisma/
  schema.prisma
  migrations/
    20260413025043_init/
      migration.sql
```

## Notas

- El datasource Prisma esta configurado para MySQL.
- La URL de base de datos se toma de `DATABASE_URL` en el archivo `.env`.
