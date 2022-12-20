.PHONY: all clean fclean rebuild debug re light hardcore update
all:
	mkdir -p /home/rschleic/data/mariadb
	mkdir -p /home/rschleic/data/wordpress
	docker compose  -f ./srcs/docker-compose.yml up -d
#       -p, --parents
            #   no error if existing, make parent directories as needed
#mariadb eigener command der schaut ob was ind en volumes dirn ist und das dann loescht?@Mo
clean:
	docker compose -f ./srcs/docker-compose.yml down 

fclean:
	docker compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	sudo rm -rf /home/rschleic/data/mariadb
	sudo rm -rf /home/rschleic/data/wordpress
	
rebuild:
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

debug:
	docker system prune -a -f

re: fclean all


light: clean all

hardcore: fclean debug all

update:
	sudo apt-get update
	sudo apt-get upgrade