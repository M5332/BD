FROM node:22-alpine AS build
WORKDIR /workspace
COPY package*.json ./
RUN npm ci
COPY . .
ARG BASE_HREF=/wedding/
RUN npm run build -- --base-href=${BASE_HREF}

FROM nginx:stable-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /workspace/dist/wedding-invitation/browser /usr/share/nginx/html
EXPOSE 80