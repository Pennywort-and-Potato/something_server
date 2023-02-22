all: run
run:
	rm -f ./tmp/pids/server.pid;
	screen bin/rails s -p 4000 -b 0.0.0.0 -e production;
run_dev:
	rm -f ./tmp/pids/server.pid;
	screen bin/rails s -p 5000 -b 0.0.0.0 -e development;
create_dev_database:
	RAILS_ENV=development bin/rails db:create;
	RAILS_ENV=development bin/rails db:migrate
create_prod_database:
	RAILS_ENV=production bin/rails db:create;
	RAILS_ENV=production bin/rails db:migrate