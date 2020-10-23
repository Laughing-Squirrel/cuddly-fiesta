# cuddly-fiesta
Express + Core UI with React + Camunda Docker


docker run -d --name camunda \
  -p 8080:8080 \
  -p 3000:3000 \
  -p 8080:8081 \
  -p 9876:9876 \ 
  laughingsquirrel/coreuireactcamunda1:latest
