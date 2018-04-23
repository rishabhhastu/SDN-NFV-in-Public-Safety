#!/usr/bin/python

from pymongo import MongoClient
import subprocess

client = MongoClient()
db = client.nextepc
collection = db.subscribers

change_stream = collection.watch([
    {'$match': {
        'operationType': {'$in': ['insert', 'replace']}
    }},
])

bashCommand = "./mongo-sync.sh"

# Loops forever.
for change in change_stream:
    process = subprocess.Popen(bashCommand, stdout=subprocess.PIPE)
    output, error = process.communicate()
