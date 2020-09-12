# docker build -t mongo .
FROM mongo
WORKDIR /files
COPY products.json ./
CMD mongoimport --uri=mongodb://172.17.0.1:27017 --collection=products --db=walmart --file=./products.json

EXPOSE 27017