run:
	rm -f ./tmp/pids/server.pid;
	RAILS_ENV=production \
	AUTH_SECRET=EMILIAIZDABEZT \
	DATABASE_URL=postgres://rails:fwFPHTjVawEtwRtV@127.0.0.1 \
	DBU=rails \
	DBP=fwFPHTjVawEtwRtV \
	sudo bin/rails s -p 4000 -b 0.0.0.0;
all: run
create_database:
	RAILS_ENV=production \
	SECRET_KEY_BASE=CKftJ?faAb|5}t*u&E^G9rR@4J5+1o)'Az`C.NzFeq'J*QCvB6efzgRh)8Y45o~
	 bin/rails db:create