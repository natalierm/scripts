# scripts

Various helper scripts.

Mostly Bash

# cloud

An AWS cloud helper script.

# fsrc and fsrc_helper

A script for finding words in source files

# ad_search 

Search for a username in an active directory

Create an ad_search.conf as per the ad_search.conf.sample file.

# network_test_server network_test_client

Used to test network ports between two machines.

Go to the server and run:

network_test_server port1 port2

Go to the client and run:

network_test_client server_ip port1 port2

# replicate_from_remote

rsync some files and also dump and restore a database.  Created to make it
easier for someone to setup a complete mirror of a production confluence or jira
system as I got sick of doing it manually for them.

I've refactored out configuration so I can store it on a public repo.

# old_and_big

Find files that haven't been used for a long time and are using a lot of space:

find . -exec old_and_big {} \; -and -print


