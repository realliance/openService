#!/bin/bash
# vim: set ft=sh

gem install rails
bundle install

rails db:migrate RAILS_ENV=test

rspec -f d