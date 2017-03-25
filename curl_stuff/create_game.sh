#!/bin/bash

#/usr/bin/curl murmuring-island-3630.herokuapp.com/games/3 -X GET
#/usr/bin/curl murmuring-island-3630.herokuapp.com/games/new -X GET
#/usr/bin/curl murmuring-island-3630.herokuapp.com/games.json -H "Content­Type: application/json" -X POST ­d '{"game":{"gamecenter_id": "99999"}' #, "turn_id": 3, "image_id": 3, "creator_id": 3, "game_type": "spell", "answer": "doe, a deer", "shared_with_all":"true"}, "clues": [{"content":"clue1", "clue_type":"Hint"}, {"content":"clue2", "clue_type":"Hint"}, {"content":"clue3", "clue_type":"Hint"}], "friends":[{"id": 3}, {"game_center_id":"01234"}] }'
/usr/bin/curl -H "Content­Type: application/json" -X POST ­d '{"game":{"game_center_id": "99999"}}' http://murmuring-island-3630.herokuapp.com/games.json #, "turn_id": 3, "image_id": 3, "creator_id": 3, "game_type": "spell", "answer": "doe, a deer", "shared_with_all":"true"}, "clues": [{"content":"clue1", "clue_type":"Hint"}, {"content":"clue2", "clue_type":"Hint"}, {"content":"clue3", "clue_type":"Hint"}], "friends":[{"id": 3}, {"game_center_id":"01234"}] }'
