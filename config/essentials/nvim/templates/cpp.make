FILE = 

$(FILE): $(FILE).cpp
	c++ -Wall -Werror -ggdb $(FILE).cpp -o $(FILE)
