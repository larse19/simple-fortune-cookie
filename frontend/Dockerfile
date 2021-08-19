FROM golang:1.17-alpine

WORKDIR /app

COPY . ./

RUN ls && ls ./frontend

RUN go mod init frontend && go build -o /frontend

EXPOSE 8080

CMD [ "/frontend" ]