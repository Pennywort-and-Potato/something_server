SETTING_ENV:
	RAILS_ENV=production AUTH_SECRET=EMILIAIZDABEZT DATABASE_URL=postgres://rails:fwFPHTjVawEtwRtV@51.79.145.63
run: SETTING_ENV
	rm -f ./tmp/pids/server.pid; sudo ./bin/rails s -p 4000 -b 0.0.0.0;
all: SETTING_ENV run