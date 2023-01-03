FROM golang:latest as stage

WORKDIR /app
COPY main.go .
COPY go.mod .
RUN go build -o main

FROM scratch
WORKDIR /src/app
COPY --from=stage /app/main .
CMD [ "./main" ]