run:
	export RAILS_ENV=production;
	export AUTH_SECRET=EMILIAIZDABEZT;
	export DATABASE_URL=postgres://rails:fwFPHTjVawEtwRtV@127.0.0.1;
	export DBU=rails;
	export DBP=fwFPHTjVawEtwRtV;
	rm -f ./tmp/pids/server.pid;
	sudo ./bin/rails s -p 4000 -b 0.0.0.0;
all: run