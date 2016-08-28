#!/bin/bash
j="$1"
export j
echo $( python -c " 
from lxml import html
import requests
import os 
q='https://www.youtube.com/results?search_query=' + os.environ['j'] 
page= requests.get(q)
tree = html.fromstring(page.content)
buyers = tree.xpath('//div[@data-context-item-id]')
p=buyers[0].get('data-context-item-id')
print 'http://www.youtube.com/watch?v='+p")|xargs youtube-dl --output '~/Music/Youtube/%(title)s.%(ext)s'  --extract-audio --audio-format mp3  --audio-quality=320k 




                  
