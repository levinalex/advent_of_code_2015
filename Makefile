SHELL := /bin/bash

all: 1 2 3

1:
	@diff -u data/day-01.expected <( \
			./day-01/a.rb < data/day-01.input.txt; \
			./day-01/b.rb < data/day-01.input.txt; \
		)

2:
	@diff -u data/day-02.expected <( \
			./day-02/a.rb < data/day-02.input.txt; \
			./day-02/b.rb < data/day-02.input.txt; \
		)

3:
	@diff -u data/day-03.expected <( \
			./day-03/a.rb < data/day-03.input.txt; \
			./day-03/b.rb < data/day-03.input.txt; \
		)

4:
	@diff -u data/day-04.expected <( \
			./day-04/a.rb 5 < data/day-04.input.txt; \
			./day-04/a.rb 6 < data/day-04.input.txt; \
		)

5:
	@diff -u data/day-05.expected <( \
			./day-05/a.rb < data/day-05.input.txt; \
			./day-05/b.rb < data/day-05.input.txt; \
		)

6:
	@diff -u data/day-06.expected <( \
			./day-06/a.rb 1000 < data/day-06.input.txt; \
			./day-06/b.rb 1000 < data/day-06.input.txt; \
		)

7:
	@diff -u data/day-07.expected <( \
			./day-07/a.rb < data/day-07.input.txt; \
		)
