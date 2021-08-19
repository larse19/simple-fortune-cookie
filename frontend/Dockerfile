FROM golang:1.17-alpine

#WORKDIR /app

COPY . ./

#RUN ls && echo "hello world" && ls ./frontend && echo "Goodbye world" && pwd

RUN rm go.mod
RUN go build -o /frontend

EXPOSE 8080

CMD [ "/frontend" ]