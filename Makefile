run:
	rm -f ./tmp/pids/server.pid;
	screen bin/rails s -p 4000 -b 0.0.0.0 -e development;
all: run
create_database:
	RAILS_ENV=development bin/rails db:create;
	RAILS_ENV=development bin/rails db:migrate