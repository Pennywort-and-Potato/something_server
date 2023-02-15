run:
	rm -f ./tmp/pids/server.pid;
	screen "RAILS_ENV=production bin/rails s -p 4000 -b 0.0.0.0;"
all: run
create_database:
	RAILS_ENV=production bin/rails db:create