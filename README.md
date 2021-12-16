# menu-backend

Note on running tests:

The config for resetting the database between tests does not work on my machine
(Ubuntu VM running on a windows laptop) and I have not found the root cause yet.
So for now, I have a script that resets the development and test databases that
is meant to be run between each DB test (or as desired when playing with rails
console when not in sandbox mode). For example, to run all existing tests as
of the last update to this doc:

```
./test-db-reset-workaround.sh
rspec spec/models

./test-db-reset-workaround.sh
rspec spec/db/menu_spec.rb

./test-db-reset-workaround.sh
rspec spec/db/menu_item_spec.rb

./test-db-reset-workaround.sh
rspec spec/db/restaurant_spec.rb
```

