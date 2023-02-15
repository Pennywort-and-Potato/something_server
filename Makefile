SETTING_ENV:
	RAILS_ENV=production AUTH_SECRET=EMILIAIZDABEZT
run:
	rm -f ./tmp/pids/server.pid; rails s -p 4000 -b 0.0.0.0;