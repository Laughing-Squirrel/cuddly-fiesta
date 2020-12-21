# cuddly-fiesta
Express + Core UI with React + Camunda Docker


docker run -d --name camunda -p 8080:8080 -p 5000:5000 -p 8081:8081 -p 9876:9876 laughingsquirrel/coreuireactcamunda1:latest

http://localhost:8080/camunda-welcome/index.html



                
To Do:  Create db-env.txt
  DB_DRIVER=org.postgresql.Driver
  DB_URL=jdbc:postgresql://db:5432/process-engine
  DB_USERNAME=camunda
  DB_PASSWORD=camunda
  WAIT_FOR=db:5432
 
 
 docker run -d --name camunda -p 8080:8080 --link postgresql:db \
           --env-file db-env.txt camunda/camunda-bpm-platform:latest

Test
