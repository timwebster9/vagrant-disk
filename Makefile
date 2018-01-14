.DEFAULT=up

up:
	vagrant up

clean:
	vagrant destroy -f

provision:
	vagrant provision
