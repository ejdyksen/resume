#!/usr/bin/env sh

rm -rf dist/
cp -R src/ dist/

cat dist/resume.html | sed '/private-contact-1/I,+3 d' | sed '/private-contact-2/I,+4 d' | sed '/noindex/d' > dist/index.html

PLACEHOLDER_PHONE='+1 (123) 456-7890'
PLACEHOLDER_ADDR='City, ST &nbsp;12345'

cat dist/resume.html | sed "s/$PLACEHOLDER_PHONE/$PHONE/g" | sed "s/$PLACEHOLDER_ADDR/$ADDR/g" >| dist/$URL.html
rm dist/resume.html
