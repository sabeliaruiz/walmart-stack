#! /bin/bash

mongoimport --uri=mongodb://172.17.0.1:27017 --collection=products --db=walmart --file=./products.json
