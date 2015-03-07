# scripts

Various helper scripts.

Mostly Bash

# cloud

An AWS cloud helper script.

# fsrc and fsrc_helper

A script for finding words in source files

# old_and_big

Find files that haven't been used for a long time and are using a lot of space:

find . -exec old_and_big {} \; -and -print

# ad_search 

Search for a username in an active directory

Create an ad_search.conf as per the ad_search.conf.sample file.

# network_test_server network_test_client

Used to test network ports between two machines.

Go to the server and run:

network_test_server <port1> <port2>

Go to the client and run:

network_test_client <server ip> <port1> <port2>