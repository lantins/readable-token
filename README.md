readable-token
========

[![Build Status](https://secure.travis-ci.org/lantins/readable-token.png?branch=master)](http://travis-ci.org/lantins/readable-token)
[![Gem Version](https://badge.fury.io/rb/readable-token.png)](http://badge.fury.io/rb/readable-token)

A tiny Ruby library for generating human readable "tokens".

## Installation

Add this line to your Gemfile:

    gem 'readable-token'

And then execute:

    bundle install

Require the gem in your code:

    require 'readable-token'

## Usage

### Generate a token

    ReadableToken.generate
    ReadableToken.generate(min: 6)
    ReadableToken.generate(max: 8)
    ReadableToken.generate(separator: '|')

### Loading your own word list

    generator = ReadableToken.new(%w(cat penguin password))

# Development

## Development Commands

    # run all tests and build code coverage
    bundle exec rake test

    # hints where to improve docs
    bundle exec inch

# TODO
