#!/bin/sh
rails assets:precompile
rails db:migrate
rails server