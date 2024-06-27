FROM node:20-alpine

RUN apk update && apk add git
RUN npm install -g pnpm

# Get Mokkify
EXPOSE 7043
RUN git clone https://github.com/Wavix/Mokkify.git
WORKDIR Mokkify
RUN pnpm install
RUN pnpm cli dbcreate
RUN pnpm cli useradd admin admin
COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["/bin/sh", "./entrypoint.sh"]
