run:
	rm -f ./tmp/pids/server.pid;
	RAILS_ENV=production AUTH_SECRET=EMILIAIZDABEZT DATABASE_URL=postgres://rails:fwFPHTjVawEtwRtV@127.0.0.1 DBU=rails DBP=fwFPHTjVawEtwRtV screen sudo bin/rails s -p 4000 -b 0.0.0.0;
all: run
create_database:
	RAILS_ENV=production SECRET_KEY_BASE=627D735E6934EA6D69F1B8C27E72C bin/rails db:create