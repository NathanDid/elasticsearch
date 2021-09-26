status:
	systemctl status elasticsearch

start:
	sudo systemctl start elasticsearch

stop:
	sudo systemctl stop elasticsearch

main:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XGET "localhost:9200"

indexes:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XGET "localhost:9200/_aliases"

delete:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XDELETE "localhost:9200/pokedex"

fixtures:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XPOST "localhost:9200/pokedex/_bulk?pretty" -H 'Content-Type: application/json' --data-binary @fixtures.json

find_pikachu:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XGET "localhost:9200/pokedex/_search" -H 'Content-Type: application/json' -d '{"query": {"match": {"name": "Pikachu"}}}'

find_fire:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XGET "localhost:9200/pokedex/_search" -H 'Content-Type: application/json' -d '{"query": {"match": {"type 1": "Fire"}}}'

find_fire2:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XGET "localhost:9200/pokedex/_search" -H 'Content-Type: application/json' -d '{"size":10000, "query": {"match": {"type 1": "Fire"}}}'

find_fire3:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XGET "localhost:9200/pokedex/_search" -H 'Content-Type: application/json' -d '{"sort" : [{"attack": {"unmapped_type" : "long", "order" : "desc"} }], "query": {"match": {"type 1": "Fire"}}}'

find_pika:
	curl -u elastic:dibg60l4XjkIrae7HSyK -XGET "localhost:9200/pokedex/_search" -H 'Content-Type: application/json' -d '{"query": {"fuzzy": {"name": {"value": "pikachou"}}}}'