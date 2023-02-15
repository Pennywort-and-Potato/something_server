run:
	rm -f ./tmp/pids/server.pid;
	screen bin/rails s -p 4000 -b 0.0.0.0 -e production;
all: run
create_database:
	RAILS_ENV=production bin/rails db:create;
	RAILS_ENV=production bin/rails db:migrate