#!/bin/sh

rm -f ./tmp/pids/server.pid; 
rails db:create && rails db:migrate; 
rails s -p 4000 -b 0.0.0.0;