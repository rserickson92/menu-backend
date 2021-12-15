#!/bin/bash

rails db:drop db:create db:migrate
RAILS_ENV=test rails db:migrate

