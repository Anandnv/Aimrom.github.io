#!/bin/bash
# taken from https://scotthelme.co.uk/brotli-compression/
# minor improvements by @anupritaisno1
brotlicomp=$(which brotli);
gzipcomp=$(which gzip);
bropts="-Z -k";
gzopts="-9 -k";
echo "if you get an error, please run 'apt install brotli gzip'" ;
### Cleanup ###
for x in `find -type f -name '*.br' -o -name '*.gz'`;
do
	rm -rf ${x} ;
done;
### START OPTIMIZATION ###
for x in `find -type f -name '*.js' -o -name '*.css'`;
do
	$brotlicomp ${bropts} ${x} ;
	$gzipcomp ${gzopts} ${x} ;
done;
