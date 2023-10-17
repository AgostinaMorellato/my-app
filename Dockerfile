# Etapa de construcción (Build Stage)
FROM node:13.12.0-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install
COPY . .

# Etapa de producción
FROM node:13.12.0-alpine 
WORKDIR /app
COPY --from=build /app ./

# Exponer el puerto 3000 en el contenedor
EXPOSE 3000

# Iniciar la aplicación en modo de producción
CMD ["npm", "start"]
