# rOpenSci tutorial
Gokul Raj Suresh Kumar  
`r format(Sys.Date())`  




```r
library(tidyverse)
library(rvest)
library(xml2)
library(jsonlite)
library(httr)
library(listviewer)
library(XML)
```

##Collecting data from an API


```r
jon <- GET(url = "http://anapioficeandfire.com/api/characters/583")
jon$headers
```

```
## $date
## [1] "Wed, 07 Dec 2016 23:34:00 GMT"
## 
## $`content-type`
## [1] "application/json; charset=utf-8"
## 
## $`content-length`
## [1] "515"
## 
## $connection
## [1] "keep-alive"
## 
## $`set-cookie`
## [1] "__cfduid=d82de2de849caeabc5f2b7f5547b236351481153640; expires=Thu, 07-Dec-17 23:34:00 GMT; path=/; domain=.anapioficeandfire.com; HttpOnly"
## 
## $`cache-control`
## [1] "public, max-age=2678400"
## 
## $`content-encoding`
## [1] "gzip"
## 
## $`last-modified`
## [1] "Wed, 30 Nov 2016 01:48:37 GMT"
## 
## $etag
## [1] "\"625a277502704b11831bf449b59644a6\""
## 
## $vary
## [1] "Accept-Encoding"
## 
## $`x-aspnet-version`
## [1] "4.0.30319"
## 
## $`x-powered-by`
## [1] "ASP.NET"
## 
## $`cf-cache-status`
## [1] "HIT"
## 
## $expires
## [1] "Sat, 07 Jan 2017 23:34:00 GMT"
## 
## $server
## [1] "cloudflare-nginx"
## 
## $`cf-ray`
## [1] "30dbc92ef2051b9d-SEA"
## 
## attr(,"class")
## [1] "insensitive" "list"
```

```r
jon$status_code
```

```
## [1] 200
```

```r
jsonedit(content(jon, as = "parsed"))
```

<!--html_preserve--><div id="htmlwidget-2961579d11c1fac1e489" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-2961579d11c1fac1e489">{"x":{"data":{"url":"http://anapioficeandfire.com/api/characters/583","name":"Jon Snow","gender":"Male","culture":"Northmen","born":"In 283 AC","died":"","titles":["Lord Commander of the Night's Watch"],"aliases":["Lord Snow","Ned Stark's Bastard","The Snow of Winterfell","The Crow-Come-Over","The 998th Lord Commander of the Night's Watch","The Bastard of Winterfell","The Black Bastard of the Wall","Lord Crow"],"father":"","mother":"","spouse":"","allegiances":["http://anapioficeandfire.com/api/houses/362"],"books":["http://anapioficeandfire.com/api/books/5"],"povBooks":["http://anapioficeandfire.com/api/books/1","http://anapioficeandfire.com/api/books/2","http://anapioficeandfire.com/api/books/3","http://anapioficeandfire.com/api/books/8"],"tvSeries":["Season 1","Season 2","Season 3","Season 4","Season 5","Season 6"],"playedBy":["Kit Harington"]},"options":{"mode":"tree","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
content(jon)
```

```
## $url
## [1] "http://anapioficeandfire.com/api/characters/583"
## 
## $name
## [1] "Jon Snow"
## 
## $gender
## [1] "Male"
## 
## $culture
## [1] "Northmen"
## 
## $born
## [1] "In 283 AC"
## 
## $died
## [1] ""
## 
## $titles
## $titles[[1]]
## [1] "Lord Commander of the Night's Watch"
## 
## 
## $aliases
## $aliases[[1]]
## [1] "Lord Snow"
## 
## $aliases[[2]]
## [1] "Ned Stark's Bastard"
## 
## $aliases[[3]]
## [1] "The Snow of Winterfell"
## 
## $aliases[[4]]
## [1] "The Crow-Come-Over"
## 
## $aliases[[5]]
## [1] "The 998th Lord Commander of the Night's Watch"
## 
## $aliases[[6]]
## [1] "The Bastard of Winterfell"
## 
## $aliases[[7]]
## [1] "The Black Bastard of the Wall"
## 
## $aliases[[8]]
## [1] "Lord Crow"
## 
## 
## $father
## [1] ""
## 
## $mother
## [1] ""
## 
## $spouse
## [1] ""
## 
## $allegiances
## $allegiances[[1]]
## [1] "http://anapioficeandfire.com/api/houses/362"
## 
## 
## $books
## $books[[1]]
## [1] "http://anapioficeandfire.com/api/books/5"
## 
## 
## $povBooks
## $povBooks[[1]]
## [1] "http://anapioficeandfire.com/api/books/1"
## 
## $povBooks[[2]]
## [1] "http://anapioficeandfire.com/api/books/2"
## 
## $povBooks[[3]]
## [1] "http://anapioficeandfire.com/api/books/3"
## 
## $povBooks[[4]]
## [1] "http://anapioficeandfire.com/api/books/8"
## 
## 
## $tvSeries
## $tvSeries[[1]]
## [1] "Season 1"
## 
## $tvSeries[[2]]
## [1] "Season 2"
## 
## $tvSeries[[3]]
## [1] "Season 3"
## 
## $tvSeries[[4]]
## [1] "Season 4"
## 
## $tvSeries[[5]]
## [1] "Season 5"
## 
## $tvSeries[[6]]
## [1] "Season 6"
## 
## 
## $playedBy
## $playedBy[[1]]
## [1] "Kit Harington"
```


```r
get_bin <- GET(url = "https://httpbin.org/get")
get_bin$headers[["content-type"]]
```

```
## [1] "application/json"
```

```r
get_bin$status_code
```

```
## [1] 200
```

```r
content(get_bin)
```

```
## $args
## named list()
## 
## $headers
## $headers$Accept
## [1] "application/json, text/xml, application/xml, */*"
## 
## $headers$`Accept-Encoding`
## [1] "gzip, deflate"
## 
## $headers$Host
## [1] "httpbin.org"
## 
## $headers$`User-Agent`
## [1] "libcurl/7.51.0 r-curl/2.3 httr/1.2.1"
## 
## 
## $origin
## [1] "207.102.86.161"
## 
## $url
## [1] "https://httpbin.org/get"
```

```r
get_bin$request
```

```
## <request>
## GET https://httpbin.org/get
## Output: write_memory
## Options:
## * useragent: libcurl/7.51.0 r-curl/2.3 httr/1.2.1
## * cainfo: C:/Users/GokulRaj/Documents/R/win-library/3.3/openssl/cacert.pem
## * httpget: TRUE
## Headers:
## * Accept: application/json, text/xml, application/xml, */*
```

```r
res <- GET(url = "https://httpbin.org/get", accept_json())
res$headers
```

```
## $server
## [1] "nginx"
## 
## $date
## [1] "Wed, 07 Dec 2016 23:34:01 GMT"
## 
## $`content-type`
## [1] "application/json"
## 
## $`content-length`
## [1] "267"
## 
## $connection
## [1] "keep-alive"
## 
## $`access-control-allow-origin`
## [1] "*"
## 
## $`access-control-allow-credentials`
## [1] "true"
## 
## attr(,"class")
## [1] "insensitive" "list"
```

```r
server_err <- GET(url = "https://httpbin.org/status/400")
server_err$status_code
```

```
## [1] 400
```

```r
content(server_err)
```

```
## NULL
```

```r
client_err <- GET(url = "https://httpbin.org/status/500")
client_err$status_code
```

```
## [1] 500
```

```r
content(client_err)
```

```
## NULL
```


```r
r2 <- GET(url = "https://swapi.co/api/people/", query = list(search = "r2"))
r2$headers
```

```
## $date
## [1] "Wed, 07 Dec 2016 23:34:02 GMT"
## 
## $`content-type`
## [1] "application/json"
## 
## $`set-cookie`
## [1] "__cfduid=d918aa873797094095dc5e9986fba36091481153641; expires=Thu, 07-Dec-17 23:34:01 GMT; path=/; domain=.swapi.co; HttpOnly"
## 
## $allow
## [1] "GET, HEAD, OPTIONS"
## 
## $etag
## [1] "W/\"b6c4f00b4370d0283b6d620340333b4d\""
## 
## $vary
## [1] "Accept, Cookie"
## 
## $`x-frame-options`
## [1] "SAMEORIGIN"
## 
## $via
## [1] "1.1 vegur"
## 
## $server
## [1] "cloudflare-nginx"
## 
## $`cf-ray`
## [1] "30dbc935cb1a29d7-SEA"
## 
## $`content-encoding`
## [1] "gzip"
## 
## attr(,"class")
## [1] "insensitive" "list"
```

```r
r2$status_code
```

```
## [1] 200
```

```r
r2$request
```

```
## <request>
## GET https://swapi.co/api/people/?search=r2
## Output: write_memory
## Options:
## * useragent: libcurl/7.51.0 r-curl/2.3 httr/1.2.1
## * cainfo: C:/Users/GokulRaj/Documents/R/win-library/3.3/openssl/cacert.pem
## * httpget: TRUE
## Headers:
## * Accept: application/json, text/xml, application/xml, */*
```

```r
jsonedit(content(r2, as = "parsed"))
```

<!--html_preserve--><div id="htmlwidget-439885e69ca2641097b1" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-439885e69ca2641097b1">{"x":{"data":{"count":1,"next":[],"previous":[],"results":[{"name":"R2-D2","height":"96","mass":"32","hair_color":"n/a","skin_color":"white, blue","eye_color":"red","birth_year":"33BBY","gender":"n/a","homeworld":"http://swapi.co/api/planets/8/","films":["http://swapi.co/api/films/5/","http://swapi.co/api/films/4/","http://swapi.co/api/films/6/","http://swapi.co/api/films/3/","http://swapi.co/api/films/2/","http://swapi.co/api/films/1/","http://swapi.co/api/films/7/"],"species":["http://swapi.co/api/species/2/"],"vehicles":[],"starships":[],"created":"2014-12-10T15:11:50.376000Z","edited":"2014-12-20T21:17:50.311000Z","url":"http://swapi.co/api/people/3/"}]},"options":{"mode":"tree","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


```r
inception_json <- GET("http://www.omdbapi.com/?t=inception&y=&plot=short&r=json")
inception_json$status_code
```

```
## [1] 200
```

```r
inception_json$headers
```

```
## $date
## [1] "Wed, 07 Dec 2016 23:34:02 GMT"
## 
## $`content-type`
## [1] "application/json; charset=utf-8"
## 
## $`transfer-encoding`
## [1] "chunked"
## 
## $connection
## [1] "keep-alive"
## 
## $`set-cookie`
## [1] "__cfduid=d629dc59b8a838ebf47490ee30618a9411481153642; expires=Thu, 07-Dec-17 23:34:02 GMT; path=/; domain=.omdbapi.com; HttpOnly"
## 
## $`cache-control`
## [1] "public, max-age=86400"
## 
## $expires
## [1] "Thu, 08 Dec 2016 23:34:02 GMT"
## 
## $`last-modified`
## [1] "Tue, 06 Dec 2016 23:42:08 GMT"
## 
## $vary
## [1] "Accept-Encoding"
## 
## $`x-aspnet-version`
## [1] "4.0.30319"
## 
## $`x-powered-by`
## [1] "ASP.NET"
## 
## $`access-control-allow-origin`
## [1] "*"
## 
## $`cf-cache-status`
## [1] "HIT"
## 
## $server
## [1] "cloudflare-nginx"
## 
## $`cf-ray`
## [1] "30dbc93811f71bd9-SEA"
## 
## $`content-encoding`
## [1] "gzip"
## 
## attr(,"class")
## [1] "insensitive" "list"
```

```r
content(inception_json, as = "text")
```

```
## [1] "{\"Title\":\"Inception\",\"Year\":\"2010\",\"Rated\":\"PG-13\",\"Released\":\"16 Jul 2010\",\"Runtime\":\"148 min\",\"Genre\":\"Action, Adventure, Sci-Fi\",\"Director\":\"Christopher Nolan\",\"Writer\":\"Christopher Nolan\",\"Actors\":\"Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy\",\"Plot\":\"A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.\",\"Language\":\"English, Japanese, French\",\"Country\":\"USA, UK\",\"Awards\":\"Won 4 Oscars. Another 144 wins & 198 nominations.\",\"Poster\":\"https://images-na.ssl-images-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg\",\"Metascore\":\"74\",\"imdbRating\":\"8.8\",\"imdbVotes\":\"1,501,172\",\"imdbID\":\"tt1375666\",\"Type\":\"movie\",\"Response\":\"True\"}"
```

```r
jsonedit(content(inception_json, as = "parsed"))
```

<!--html_preserve--><div id="htmlwidget-d525b6a80aa1e5c27e99" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-d525b6a80aa1e5c27e99">{"x":{"data":{"Title":"Inception","Year":"2010","Rated":"PG-13","Released":"16 Jul 2010","Runtime":"148 min","Genre":"Action, Adventure, Sci-Fi","Director":"Christopher Nolan","Writer":"Christopher Nolan","Actors":"Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy","Plot":"A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.","Language":"English, Japanese, French","Country":"USA, UK","Awards":"Won 4 Oscars. Another 144 wins & 198 nominations.","Poster":"https://images-na.ssl-images-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg","Metascore":"74","imdbRating":"8.8","imdbVotes":"1,501,172","imdbID":"tt1375666","Type":"movie","Response":"True"},"options":{"mode":"tree","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
inception_xml <- GET("http://www.omdbapi.com/?t=inception&y=&plot=short&r=xml")
inception_xml$headers
```

```
## $date
## [1] "Wed, 07 Dec 2016 23:34:02 GMT"
## 
## $`content-type`
## [1] "text/xml; charset=utf-8"
## 
## $`transfer-encoding`
## [1] "chunked"
## 
## $connection
## [1] "keep-alive"
## 
## $`cache-control`
## [1] "public, max-age=86400"
## 
## $expires
## [1] "Thu, 08 Dec 2016 23:34:02 GMT"
## 
## $`last-modified`
## [1] "Tue, 06 Dec 2016 23:42:46 GMT"
## 
## $vary
## [1] "Accept-Encoding"
## 
## $`x-aspnet-version`
## [1] "4.0.30319"
## 
## $`x-powered-by`
## [1] "ASP.NET"
## 
## $`access-control-allow-origin`
## [1] "*"
## 
## $`cf-cache-status`
## [1] "HIT"
## 
## $server
## [1] "cloudflare-nginx"
## 
## $`cf-ray`
## [1] "30dbc93872521bd9-SEA"
## 
## $`content-encoding`
## [1] "gzip"
## 
## attr(,"class")
## [1] "insensitive" "list"
```

```r
content(inception_xml, as = "text")
```

```
## [1] "<?xml version=\"1.0\" encoding=\"UTF-8\"?><root response=\"True\"><movie title=\"Inception\" year=\"2010\" rated=\"PG-13\" released=\"16 Jul 2010\" runtime=\"148 min\" genre=\"Action, Adventure, Sci-Fi\" director=\"Christopher Nolan\" writer=\"Christopher Nolan\" actors=\"Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy\" plot=\"A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.\" language=\"English, Japanese, French\" country=\"USA, UK\" awards=\"Won 4 Oscars. Another 144 wins &amp; 198 nominations.\" poster=\"https://images-na.ssl-images-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_SX300.jpg\" metascore=\"74\" imdbRating=\"8.8\" imdbVotes=\"1,501,172\" imdbID=\"tt1375666\" type=\"movie\"/></root>"
```

```r
content(inception_xml, as = "parsed")
```

```
## Warning in doc_parse_raw(x, encoding = encoding, base_url = base_url,
## as_html = as_html, : '.Random.seed' is not an integer vector but of type
## 'NULL', so ignored
```

```
## {xml_document}
## <root response="True">
## [1] <movie title="Inception" year="2010" rated="PG-13" released="16 Jul  ...
```

##APIs and Endpoints


```r
web_call <- GET("http://swapi.co/api/planets/1/")
web_call
```

```
## Response [http://swapi.co/api/planets/1/]
##   Date: 2016-12-07 23:34
##   Status: 200
##   Content-Type: application/json
##   Size: 805 B
```

```r
ru <- GET("https://api.randomuser.me/")
status_code(ru)
```

```
## [1] 200
```

```r
owm <- GET("http://api.openweathermap.org/data/2.5/forecast?id=524901")
status_code(owm)
```

```
## [1] 401
```

```r
warn_for_status(owm)
```

```
## Warning: Unauthorized (HTTP 401).
```


```r
call <- GET("http://google.com")
result <- content(call, as = "text")
result
```

```
## [1] "<!doctype html><html itemscope=\"\" itemtype=\"http://schema.org/WebPage\" lang=\"en-CA\"><head><meta content=\"text/html; charset=UTF-8\" http-equiv=\"Content-Type\"><meta content=\"/logos/doodles/2016/340th-anniversary-of-the-determination-of-the-speed-of-light-5651280530767872.2-hp.gif\" itemprop=\"image\"><meta content=\"340th anniversary of the determination of the speed of light! #GoogleDoodle\" property=\"og:description\"><meta content=\"http://www.google.com/logos/doodles/2016/340th-anniversary-of-the-determination-of-the-speed-of-light-5651280530767872-thp.png\" property=\"og:image\"><meta content=\"691\" property=\"og:image:width\"><meta content=\"225\" property=\"og:image:height\"><meta content=\"http://www.google.com/logos/doodles/2016/340th-anniversary-of-the-determination-of-the-speed-of-light-5651280530767872-hp2x.gif\" property=\"og:url\"><meta content=\"video.other\" property=\"og:type\"><title>Google</title><script>(function(){window.google={kEI:'a5xIWLmCBYqSjwPhlh8',kEXPI:'750722,1351903,1352402,3700328,4029815,4031109,4032678,4036527,4038012,4039268,4043492,4045841,4048347,4052304,4062666,4063220,4065787,4068550,4069839,4069840,4070140,4072364,4072602,4072775,4073111,4073405,4073726,4073915,4073959,4075769,4076096,4076607,4076930,4076999,4078438,4078456,4079105,4079626,4079894,4079954,4080167,4080629,4081037,4081038,4082217,4082618,4082638,4083353,4083476,4084148,4084179,4084298,4084343,4084956,4085057,4085627,4085712,4085769,4086202,4086874,4087016,4087170,4087912,4088421,4088429,4088436,4088443,4088448,4089141,4089233,4089421,4089480,4089538,8300272,8503585,8505025,8505259,8505831,8506340,8506399,8506615,8507380,8507420,8507897,8507899,8507974,8508022,8508060,8508066,8508112,8508229,8508292,8508395,8508421,8508589,8508910,8508931,8508956,8509006,8509016,8509037,8509064,8509066,10200083,10201957,10202204,10202213,13500020,16200075',authuser:0,kscs:'c9c918f0_24'};google.kHL='en-CA';})();(function(){google.lc=[];google.li=0;google.getEI=function(a){for(var b;a&&(!a.getAttribute||!(b=a.getAttribute(\"eid\")));)a=a.parentNode;return b||google.kEI};google.getLEI=function(a){for(var b=null;a&&(!a.getAttribute||!(b=a.getAttribute(\"leid\")));)a=a.parentNode;return b};google.https=function(){return\"https:\"==window.location.protocol};google.ml=function(){return null};google.wl=function(a,b){try{google.ml(Error(a),!1,b)}catch(c){}};google.time=function(){return(new Date).getTime()};google.log=function(a,b,c,d,g){a=google.logUrl(a,b,c,d,g);if(\"\"!=a){b=new Image;var e=google.lc,f=google.li;e[f]=b;b.onerror=b.onload=b.onabort=function(){delete e[f]};window.google&&window.google.vel&&window.google.vel.lu&&window.google.vel.lu(a);b.src=a;google.li=f+1}};google.logUrl=function(a,b,c,d,g){var e=\"\",f=google.ls||\"\";c||-1!=b.search(\"&ei=\")||(e=\"&ei=\"+google.getEI(d),-1==b.search(\"&lei=\")&&(d=google.getLEI(d))&&(e+=\"&lei=\"+d));a=c||\"/\"+(g||\"gen_204\")+\"?atyp=i&ct=\"+a+\"&cad=\"+b+e+f+\"&zx=\"+google.time();/^http:/i.test(a)&&google.https()&&(google.ml(Error(\"a\"),!1,{src:a,glmm:1}),a=\"\");return a};google.y={};google.x=function(a,b){google.y[a.id]=[a,b];return!1};google.lq=[];google.load=function(a,b,c){google.lq.push([[a],b,c])};google.loadAll=function(a,b){google.lq.push([a,b])};}).call(this);var a=window.location,b=a.href.indexOf(\"#\");if(0<=b){var c=a.href.substring(b+1);/(^|&)q=/.test(c)&&-1==c.indexOf(\"#\")&&a.replace(\"/search?\"+c.replace(/(^|&)fp=[^&]*/g,\"\")+\"&cad=h\")};</script><style>#gbar,#guser{font-size:13px;padding-top:1px !important;}#gbar{height:22px}#guser{padding-bottom:7px !important;text-align:right}.gbh,.gbd{border-top:1px solid #c9d7f1;font-size:1px}.gbh{height:0;position:absolute;top:24px;width:100%}@media all{.gb1{height:22px;margin-right:.5em;vertical-align:top}#gbar{float:left}}a.gb1,a.gb4{text-decoration:underline !important}a.gb1,a.gb4{color:#00c !important}.gbi .gb4{color:#dd8e27 !important}.gbf .gb4{color:#900 !important}\n</style><style>body,td,a,p,.h{font-family:arial,sans-serif}body{margin:0;overflow-y:scroll}#gog{padding:3px 8px 0}td{line-height:.8em}.gac_m td{line-height:17px}form{margin-bottom:20px}.h{color:#36c}.q{color:#00c}.ts td{padding:0}.ts{border-collapse:collapse}em{font-weight:bold;font-style:normal}.lst{height:25px;width:496px}.gsfi,.lst{font:18px arial,sans-serif}.gsfs{font:17px arial,sans-serif}.ds{display:inline-box;display:inline-block;margin:3px 0 4px;margin-left:4px}input{font-family:inherit}a.gb1,a.gb2,a.gb3,a.gb4{color:#11c !important}body{background:#fff;color:black}a{color:#11c;text-decoration:none}a:hover,a:active{text-decoration:underline}.fl a{color:#36c}a:visited{color:#551a8b}a.gb1,a.gb4{text-decoration:underline}a.gb3:hover{text-decoration:none}#ghead a.gb2:hover{color:#fff !important}.sblc{padding-top:5px}.sblc a{display:block;margin:2px 0;margin-left:13px;font-size:11px}.lsbb{background:#eee;border:solid 1px;border-color:#ccc #999 #999 #ccc;height:30px}.lsbb{display:block}.ftl,#fll a{display:inline-block;margin:0 12px}.lsb{background:url(/images/nav_logo229.png) 0 -261px repeat-x;border:none;color:#000;cursor:pointer;height:30px;margin:0;outline:0;font:15px arial,sans-serif;vertical-align:top}.lsb:active{background:#ccc}.lst:focus{outline:none}</style><script></script><link href=\"/images/branding/product/ico/googleg_lodp.ico\" rel=\"shortcut icon\"></head><body bgcolor=\"#fff\"><script>(function(){var src='/images/nav_logo229.png';var iesg=false;document.body.onload = function(){window.n && window.n();if (document.images){new Image().src=src;}\nif (!iesg){document.f&&document.f.q.focus();document.gbqf&&document.gbqf.q.focus();}\n}\n})();</script><div id=\"mngb\"> <div id=gbar><nobr><b class=gb1>Search</b> <a class=gb1 href=\"http://www.google.ca/imghp?hl=en&tab=wi\">Images</a> <a class=gb1 href=\"http://maps.google.ca/maps?hl=en&tab=wl\">Maps</a> <a class=gb1 href=\"https://play.google.com/?hl=en&tab=w8\">Play</a> <a class=gb1 href=\"http://www.youtube.com/?gl=CA&tab=w1\">YouTube</a> <a class=gb1 href=\"http://news.google.ca/nwshp?hl=en&tab=wn\">News</a> <a class=gb1 href=\"https://mail.google.com/mail/?tab=wm\">Gmail</a> <a class=gb1 href=\"https://drive.google.com/?tab=wo\">Drive</a> <a class=gb1 style=\"text-decoration:none\" href=\"https://www.google.ca/intl/en/options/\"><u>More</u> &raquo;</a></nobr></div><div id=guser width=100%><nobr><span id=gbn class=gbi></span><span id=gbf class=gbf></span><span id=gbe></span><a href=\"http://www.google.ca/history/optout?hl=en\" class=gb4>Web History</a> | <a  href=\"/preferences?hl=en\" class=gb4>Settings</a> | <a target=_top id=gb_70 href=\"https://accounts.google.com/ServiceLogin?hl=en&passive=true&continue=http://www.google.ca/%3Fgfe_rd%3Dcr%26ei%3Da5xIWP7zAojt8wf0rKzQBA\" class=gb4>Sign in</a></nobr></div><div class=gbh style=left:0></div><div class=gbh style=right:0></div> </div><center><br clear=\"all\" id=\"lgpd\"><div id=\"lga\"><a href=\"/search?site=&amp;ie=UTF-8&amp;q=determination+of+the+speed+of+light&amp;oi=ddle&amp;ct=340th-anniversary-of-the-determination-of-the-speed-of-light-5651280530767872&amp;hl=en&amp;sa=X&amp;ved=0ahUKEwj544Omn-PQAhUKyWMKHWHLBwAQPQgD\"><img alt=\"340th anniversary of the determination of the speed of light\" border=\"0\" height=\"225\" src=\"/logos/doodles/2016/340th-anniversary-of-the-determination-of-the-speed-of-light-5651280530767872.2-hp.gif\" title=\"340th anniversary of the determination of the speed of light\" width=\"691\" id=\"hplogo\" onload=\"window.lol&&lol()\"><br></a><br></div><form action=\"/search\" name=\"f\"><table cellpadding=\"0\" cellspacing=\"0\"><tr valign=\"top\"><td width=\"25%\">&nbsp;</td><td align=\"center\" nowrap=\"\"><input name=\"ie\" value=\"ISO-8859-1\" type=\"hidden\"><input value=\"en-CA\" name=\"hl\" type=\"hidden\"><input name=\"source\" type=\"hidden\" value=\"hp\"><input name=\"biw\" type=\"hidden\"><input name=\"bih\" type=\"hidden\"><div class=\"ds\" style=\"height:32px;margin:4px 0\"><input style=\"color:#000;margin:0;padding:5px 8px 0 6px;vertical-align:top\" autocomplete=\"off\" class=\"lst\" value=\"\" title=\"Google Search\" maxlength=\"2048\" name=\"q\" size=\"57\"></div><br style=\"line-height:0\"><span class=\"ds\"><span class=\"lsbb\"><input class=\"lsb\" value=\"Google Search\" name=\"btnG\" type=\"submit\"></span></span><span class=\"ds\"><span class=\"lsbb\"><input class=\"lsb\" value=\"I'm Feeling Lucky\" name=\"btnI\" onclick=\"if(this.form.q.value)this.checked=1; else top.location='/doodles/'\" type=\"submit\"></span></span></td><td class=\"fl sblc\" align=\"left\" nowrap=\"\" width=\"25%\"><a href=\"/advanced_search?hl=en-CA&amp;authuser=0\">Advanced search</a><a href=\"/language_tools?hl=en-CA&amp;authuser=0\">Language tools</a></td></tr></table><input id=\"gbv\" name=\"gbv\" type=\"hidden\" value=\"1\"></form><div id=\"gac_scont\"></div><div style=\"font-size:83%;min-height:3.5em\"><br><div id=\"als\"><style>#als{font-size:small;margin-bottom:24px}#_eEe{display:inline-block;line-height:28px;}#_eEe a{padding:0 3px;}._lEe{display:inline-block;margin:0 2px;white-space:nowrap}._PEe{display:inline-block;margin:0 2px}</style><div id=\"_eEe\">Google.ca offered in: <a href=\"http://www.google.ca/setprefs?sig=0_MNT9Xhuv-RlYW9ApZFLGP5meNHk%3D&amp;hl=fr&amp;source=homepage\" data-ved=\"0ahUKEwj544Omn-PQAhUKyWMKHWHLBwAQ2ZgBCAU\">Français</a> </div></div></div><span id=\"footer\"><div style=\"font-size:10pt\"><div style=\"margin:19px auto;text-align:center\" id=\"fll\"><a href=\"/intl/en/ads/\">Advertising Programs</a><a href=\"/services/\">Business Solutions</a><a href=\"https://plus.google.com/108349337900676782287\" rel=\"publisher\">+Google</a><a href=\"/intl/en/about.html\">About Google</a><a href=\"http://www.google.ca/setprefdomain?prefdom=US&amp;sig=__dlyd1JiZERiUehUtlGmF6KG19pA%3D\" id=\"fehl\">Google.com</a></div></div><p style=\"color:#767676;font-size:8pt\">&copy; 2016 - <a href=\"/intl/en/policies/privacy/\">Privacy</a> - <a href=\"/intl/en/policies/terms/\">Terms</a></p></span></center><script>(function(){window.google.cdo={height:0,width:0};(function(){var a=window.innerWidth,b=window.innerHeight;if(!a||!b)var c=window.document,d=\"CSS1Compat\"==c.compatMode?c.documentElement:c.body,a=d.clientWidth,b=d.clientHeight;a&&b&&(a!=google.cdo.width||b!=google.cdo.height)&&google.log(\"\",\"\",\"/client_204?&atyp=i&biw=\"+a+\"&bih=\"+b+\"&ei=\"+google.kEI);}).call(this);})();</script><div id=\"xjsd\"></div><div id=\"xjsi\"><script>(function(){function c(b){window.setTimeout(function(){var a=document.createElement(\"script\");a.src=b;document.getElementById(\"xjsd\").appendChild(a)},0)}google.dljp=function(b,a){google.xjsu=b;c(a)};google.dlj=c;}).call(this);(function(){window.google.xjsrm=[];})();if(google.y)google.y.first=[];if(!google.xjs){window._=window._||{};window._._DumpException=function(e){throw e};if(google.timers&&google.timers.load.t){google.timers.load.t.xjsls=new Date().getTime();}google.dljp('/xjs/_/js/k\\x3dxjs.hp.en_US.A83a9f804i4.O/m\\x3dsb_he,d/rt\\x3dj/d\\x3d1/t\\x3dzcms/rs\\x3dACT90oF2eNnQs0ONdr_WSmdRg-UEHmCM5g','/xjs/_/js/k\\x3dxjs.hp.en_US.A83a9f804i4.O/m\\x3dsb_he,d/rt\\x3dj/d\\x3d1/t\\x3dzcms/rs\\x3dACT90oF2eNnQs0ONdr_WSmdRg-UEHmCM5g');google.xjs=1;}google.pmc={\"sb_he\":{\"agen\":true,\"cgen\":true,\"client\":\"heirloom-hp\",\"dh\":true,\"dhqt\":true,\"ds\":\"\",\"fl\":true,\"host\":\"google.ca\",\"isbh\":28,\"jam\":0,\"jsonp\":true,\"msgs\":{\"cibl\":\"Clear Search\",\"dym\":\"Did you mean:\",\"lcky\":\"I\\u0026#39;m Feeling Lucky\",\"lml\":\"Learn more\",\"oskt\":\"Input tools\",\"psrc\":\"This search was removed from your \\u003Ca href=\\\"/history\\\"\\u003EWeb History\\u003C/a\\u003E\",\"psrl\":\"Remove\",\"sbit\":\"Search by image\",\"srch\":\"Google Search\"},\"nds\":true,\"ovr\":{},\"pq\":\"\",\"refpd\":true,\"rfs\":[],\"scd\":10,\"sce\":5,\"stok\":\"bv87tgr7k9et9zOcKxpdxEB7Dc4\"},\"d\":{}};google.y.first.push(function(){if(google.med){google.med('init');google.initHistory();google.med('history');}});if(google.j&&google.j.en&&google.j.xi){window.setTimeout(google.j.xi,0);}\n</script></div></body></html>"
```

```r
class(result)
```

```
## [1] "character"
```

```r
ru1 <- GET("https://api.randomuser.me/")
person_text <- content(ru1, as = "text")
person_text
```

```
## [1] "{\"results\":[{\"gender\":\"female\",\"name\":{\"title\":\"ms\",\"first\":\"darcivana\",\"last\":\"da cunha\"},\"location\":{\"street\":\"9133 rua josé bonifácio \",\"city\":\"uberlândia\",\"state\":\"são paulo\",\"postcode\":30440},\"email\":\"darcivana.dacunha@example.com\",\"login\":{\"username\":\"ticklishsnake205\",\"password\":\"yzerman\",\"salt\":\"qAVFU8lY\",\"md5\":\"a79aafe14cb0093d370eed4f355ecbfb\",\"sha1\":\"a3b1476f8d95ec727348479e6e3192598733769d\",\"sha256\":\"011d1fad94588102cc49a75281cbefa5f644797c86b065dcfe24910f254c4994\"},\"dob\":\"1962-07-31 20:54:06\",\"registered\":\"2012-09-18 15:37:19\",\"phone\":\"(49) 9401-3215\",\"cell\":\"(58) 7310-4651\",\"id\":{\"name\":\"\",\"value\":null},\"picture\":{\"large\":\"https://randomuser.me/api/portraits/women/23.jpg\",\"medium\":\"https://randomuser.me/api/portraits/med/women/23.jpg\",\"thumbnail\":\"https://randomuser.me/api/portraits/thumb/women/23.jpg\"},\"nat\":\"BR\"}],\"info\":{\"seed\":\"0ceb12fda4bb3eee\",\"results\":1,\"page\":1,\"version\":\"1.1\"}}"
```

```r
person_parsed <- content(ru1, as = "parsed")
jsonedit(person_parsed)
```

<!--html_preserve--><div id="htmlwidget-836f3907797e8246ee06" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-836f3907797e8246ee06">{"x":{"data":{"results":[{"gender":"female","name":{"title":"ms","first":"darcivana","last":"da cunha"},"location":{"street":"9133 rua josé bonifácio ","city":"uberlândia","state":"são paulo","postcode":30440},"email":"darcivana.dacunha@example.com","login":{"username":"ticklishsnake205","password":"yzerman","salt":"qAVFU8lY","md5":"a79aafe14cb0093d370eed4f355ecbfb","sha1":"a3b1476f8d95ec727348479e6e3192598733769d","sha256":"011d1fad94588102cc49a75281cbefa5f644797c86b065dcfe24910f254c4994"},"dob":"1962-07-31 20:54:06","registered":"2012-09-18 15:37:19","phone":"(49) 9401-3215","cell":"(58) 7310-4651","id":{"name":"","value":[]},"picture":{"large":"https://randomuser.me/api/portraits/women/23.jpg","medium":"https://randomuser.me/api/portraits/med/women/23.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/23.jpg"},"nat":"BR"}],"info":{"seed":"0ceb12fda4bb3eee","results":1,"page":1,"version":"1.1"}},"options":{"mode":"tree","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


```r
num_results <- 5
args <- list(results = num_results)
random_names <- GET("http://api.randomuser.me/", query = args)
output <- content(random_names, as = "parsed")
length(output$results)
```

```
## [1] 5
```

```r
jsonedit(output)
```

<!--html_preserve--><div id="htmlwidget-084075146e8a8e9fae7a" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-084075146e8a8e9fae7a">{"x":{"data":{"results":[{"gender":"male","name":{"title":"mr","first":"chris","last":"patterson"},"location":{"street":"5793 highfield road","city":"canterbury","state":"isle of wight","postcode":"CS5T 1EQ"},"email":"chris.patterson@example.com","login":{"username":"bluedog146","password":"desert","salt":"K958RXCy","md5":"75e9e0c6dc59846e731d16c1a8145300","sha1":"c10b522e0eca4768292b556fd09a4b3a95e65ef3","sha256":"da62b941ebe6c70965542d3c55ae9d1e5241da6c6263fce9cdb3edf2e959ad0a"},"dob":"1969-10-18 10:29:03","registered":"2003-12-15 00:45:29","phone":"016973 17488","cell":"0744-753-690","id":{"name":"NINO","value":"SL 88 76 61 B"},"picture":{"large":"https://randomuser.me/api/portraits/men/7.jpg","medium":"https://randomuser.me/api/portraits/med/men/7.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/7.jpg"},"nat":"GB"},{"gender":"female","name":{"title":"miss","first":"amalie","last":"nielsen"},"location":{"street":"1780 højager","city":"esbjerg v","state":"danmark","postcode":24916},"email":"amalie.nielsen@example.com","login":{"username":"lazyladybug646","password":"goat","salt":"Sl65F8N4","md5":"f7a91c24fdfaa2efdcb8069df5140242","sha1":"372c028ad645e9478d756ecd9c204abf54d1cac6","sha256":"0cd4cf20a9cc7c9cd6c1bd4bdfe4f6a3e1678a03d0f7b563f7fe17054258e6f0"},"dob":"1986-04-24 04:15:32","registered":"2002-12-24 23:18:59","phone":"62492717","cell":"13509887","id":{"name":"CPR","value":"032869-2657"},"picture":{"large":"https://randomuser.me/api/portraits/women/39.jpg","medium":"https://randomuser.me/api/portraits/med/women/39.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/39.jpg"},"nat":"DK"},{"gender":"female","name":{"title":"miss","first":"cherissa","last":"reuvekamp"},"location":{"street":"7767 donkerstraat","city":"molenwaard","state":"drenthe","postcode":53874},"email":"cherissa.reuvekamp@example.com","login":{"username":"lazytiger785","password":"mozart","salt":"35MB4a2r","md5":"3e318b146cc6063f38d5d2329ac52c8a","sha1":"81d27ac700589fda092282537725b88aca1ecfc1","sha256":"b7c29f0af3b909c83979a3eda71d67e23905193593135e6e7cacf8370bb03546"},"dob":"1963-03-31 10:34:04","registered":"2007-02-22 01:45:25","phone":"(429)-052-6356","cell":"(358)-673-7438","id":{"name":"BSN","value":"68370267"},"picture":{"large":"https://randomuser.me/api/portraits/women/32.jpg","medium":"https://randomuser.me/api/portraits/med/women/32.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/32.jpg"},"nat":"NL"},{"gender":"male","name":{"title":"mr","first":"madate","last":"jesus"},"location":{"street":"4982 rua joão xxiii","city":"itu","state":"minas gerais","postcode":23892},"email":"madate.jesus@example.com","login":{"username":"smallcat916","password":"joey","salt":"ggHjyXEd","md5":"2a73fa057a784778b84c48a9b188f081","sha1":"314881fafdc42459d62bcba58687fb9453a6d49a","sha256":"c78fac9a31ff142acee007e5224b9e8ba7ee4df4578eebd977d5f2eebeb2c142"},"dob":"1964-06-24 00:48:44","registered":"2004-05-05 14:39:44","phone":"(64) 0871-4966","cell":"(28) 6003-6219","id":{"name":"","value":[]},"picture":{"large":"https://randomuser.me/api/portraits/men/24.jpg","medium":"https://randomuser.me/api/portraits/med/men/24.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/24.jpg"},"nat":"BR"},{"gender":"male","name":{"title":"mr","first":"willard","last":"shelton"},"location":{"street":"5793 mcclellan rd","city":"bunbury","state":"tasmania","postcode":6931},"email":"willard.shelton@example.com","login":{"username":"browntiger216","password":"norman","salt":"8RPaHIky","md5":"8fabb62463f84d34bf01b170f0098c82","sha1":"432b3558207a974758b6462ee7bba3a54635e163","sha256":"6e6cbda6f0a0b486d8f6954aabb15eb0f41db39f9f588f8957423f2e6d9228d1"},"dob":"1958-07-10 18:14:00","registered":"2011-05-30 04:33:12","phone":"07-5262-9636","cell":"0414-074-423","id":{"name":"TFN","value":"561939441"},"picture":{"large":"https://randomuser.me/api/portraits/men/95.jpg","medium":"https://randomuser.me/api/portraits/med/men/95.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/95.jpg"},"nat":"AU"}],"info":{"seed":"db21f8328b69fbf9","results":5,"page":1,"version":"1.1"}},"options":{"mode":"tree","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


```r
gen <- "male"
args1 <- list(gender = gen, results = num_results)
rnwg <- GET("http://api.randomuser.me/", query = args1)
op <- content(rnwg, as = "parsed")
jsonedit(op)
```

<!--html_preserve--><div id="htmlwidget-9debe552794b51ed99db" style="width:672px;height:480px;" class="jsonedit html-widget"></div>
<script type="application/json" data-for="htmlwidget-9debe552794b51ed99db">{"x":{"data":{"results":[{"gender":"male","name":{"title":"mr","first":"adrian","last":"förster"},"location":{"street":"7967 dorfstraße","city":"potsdam","state":"sachsen-anhalt","postcode":97007},"email":"adrian.förster@example.com","login":{"username":"browngorilla248","password":"gagging","salt":"FBRhsy5W","md5":"b0143b112362d752eff645cc874d7a12","sha1":"de555ca365d6597c3ab26de1621e750eb263c6fe","sha256":"569c22ab69c2b07ae11e5687e4b756fb3505bcda968ccc50fe66e2865e7d2153"},"dob":"1988-01-09 11:36:06","registered":"2002-04-16 01:44:42","phone":"0126-0312995","cell":"0174-3329454","id":{"name":"","value":[]},"picture":{"large":"https://randomuser.me/api/portraits/men/37.jpg","medium":"https://randomuser.me/api/portraits/med/men/37.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/37.jpg"},"nat":"DE"},{"gender":"male","name":{"title":"mr","first":"مهراد","last":"احمدی"},"location":{"street":"1190 میرزای شیرازی","city":"اهواز","state":"بوشهر","postcode":12636},"email":"مهراد.احمدی@example.com","login":{"username":"goldenfrog796","password":"playball","salt":"bntiMK0q","md5":"95d4d25cbba51695d1b8222e45250ee6","sha1":"4d423512cb4e813605cb8ac8b1a17502f0412622","sha256":"2aad6337f17d7dda6cb2200b429f6a25f48bd5c6c6607b24001c69ece0951161"},"dob":"1991-07-03 07:32:28","registered":"2011-05-01 15:13:30","phone":"004-36214762","cell":"0958-833-5871","id":{"name":"","value":[]},"picture":{"large":"https://randomuser.me/api/portraits/men/22.jpg","medium":"https://randomuser.me/api/portraits/med/men/22.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/22.jpg"},"nat":"IR"},{"gender":"male","name":{"title":"mr","first":"luke","last":"franklin"},"location":{"street":"3069 pearse street","city":"gorey","state":"donegal","postcode":24311},"email":"luke.franklin@example.com","login":{"username":"heavycat678","password":"taco","salt":"N3OEKNLR","md5":"485e9d85c578133505047165ae435b19","sha1":"6860fef69240c1f8a0ca1e15cbece77704970678","sha256":"d7325b0c0cf270cf20076c9c7ff4453c5778d2074e49e33b3f72f3cb8893dcd4"},"dob":"1961-11-30 01:26:47","registered":"2015-09-12 11:32:40","phone":"021-140-9632","cell":"081-104-2393","id":{"name":"PPS","value":"2363522T"},"picture":{"large":"https://randomuser.me/api/portraits/men/88.jpg","medium":"https://randomuser.me/api/portraits/med/men/88.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/88.jpg"},"nat":"IE"},{"gender":"male","name":{"title":"mr","first":"charlie","last":"gauthier"},"location":{"street":"5604 rue de l'abbaye","city":"mulhouse","state":"yvelines","postcode":61992},"email":"charlie.gauthier@example.com","login":{"username":"heavypanda532","password":"gregory","salt":"to8vtQWv","md5":"1368921ec4c4266f883ab8227bf529b0","sha1":"ed99ba07570a633c3d6e5ea87bab0006f102194f","sha256":"ee332eba4f6ad8ba4f77de5cd6f8fcc6714b596bccedcbcb2dc7dffab000e1e6"},"dob":"1966-11-27 13:58:31","registered":"2006-04-13 16:00:23","phone":"01-46-72-69-33","cell":"06-02-27-10-08","id":{"name":"INSEE","value":"1661075039705 96"},"picture":{"large":"https://randomuser.me/api/portraits/men/57.jpg","medium":"https://randomuser.me/api/portraits/med/men/57.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/57.jpg"},"nat":"FR"},{"gender":"male","name":{"title":"mr","first":"isauro","last":"da rocha"},"location":{"street":"5974 rua bela vista ","city":"itatiba","state":"rio de janeiro","postcode":41871},"email":"isauro.darocha@example.com","login":{"username":"yellowdog662","password":"annabell","salt":"HEWnwutj","md5":"930b4e9a08cecc4874fc3cf6d989cf7c","sha1":"5d880de1f10795d0536bc847fe3146f2c629a94e","sha256":"b8322a9c7af1de3a1970a93138dde1d9f4dfaf2535a82275093911bcfdb23816"},"dob":"1957-09-08 08:12:21","registered":"2015-09-20 13:34:13","phone":"(75) 1253-8210","cell":"(51) 8472-4530","id":{"name":"","value":[]},"picture":{"large":"https://randomuser.me/api/portraits/men/88.jpg","medium":"https://randomuser.me/api/portraits/med/men/88.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/men/88.jpg"},"nat":"BR"}],"info":{"seed":"10b7377d5da76793","results":5,"page":1,"version":"1.1"}},"options":{"mode":"tree","modes":["code","form","text","tree","view"]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


```r
owm1 <- GET("api.openweathermap.org/data/2.5/weather?zip=94708,us&appid=c39ad46e5dc633dad2e23abfc4fca507")
raw_data <- content(owm1, as = "parsed")
raw_data_csv <- unlist(raw_data)
raw_data_csv <- t(raw_data_csv)
raw_data_csv <- data.frame(raw_data_csv, stringsAsFactors = FALSE)
View(raw_data_csv)
```

##Scraping data without an API


```r
frozen <- read_html("http://www.imdb.com/title/tt2294629/")
itals <- html_nodes(frozen, "em")
html_text(itals)
```

```
## [1] "Written by\nDeAlan Wilson for ComedyE.com"
```

```r
html_name(itals)
```

```
## [1] "em"
```

```r
html_children(itals)
```

```
## {xml_nodeset (1)}
## [1] <a href="/search/title?plot_author=DeAlan%20Wilson%20for%20ComedyE.c ...
```

```r
html_attr(itals, "class")
```

```
## [1] "nobr"
```

```r
html_attrs(itals)
```

```
## [[1]]
##  class 
## "nobr"
```


```r
cast <- html_nodes(frozen, "span.itemprop")
html_text(cast)
```

```
##  [1] "Animation"                     "Adventure"                    
##  [3] "Comedy"                        "Chris Buck"                   
##  [5] "Jennifer Lee"                  "Jennifer Lee"                 
##  [7] "Hans Christian Andersen"       "Kristen Bell"                 
##  [9] "Idina Menzel"                  "Jonathan Groff"               
## [11] "Kristen Bell"                  "Tommy Lioutas"                
## [13] "Idina Menzel"                  "Jonathan Groff"               
## [15] "Josh Gad"                      "Santino Fontana"              
## [17] "Alan Tudyk"                    "Ciarán Hinds"                 
## [19] "Chris Williams"                "Stephen J. Anderson"          
## [21] "Maia Wilson"                   "Edie McClurg"                 
## [23] "Robert Pine"                   "Maurice LaMarche"             
## [25] "Livvy Stubenrauch"             "snowman"                      
## [27] "sister sister relationship"    "magic"                        
## [29] "female protagonist"            "sister love"                  
## [31] "Walt Disney Animation Studios" "Walt Disney Pictures"
```

```r
cast2 <- html_nodes(frozen, "#titleCast .itemprop")
html_text(cast2)
```

```
##  [1] "\n Kristen Bell\n          "       
##  [2] "Kristen Bell"                      
##  [3] "\n Tommy Lioutas\n          "      
##  [4] "Tommy Lioutas"                     
##  [5] "\n Idina Menzel\n          "       
##  [6] "Idina Menzel"                      
##  [7] "\n Jonathan Groff\n          "     
##  [8] "Jonathan Groff"                    
##  [9] "\n Josh Gad\n          "           
## [10] "Josh Gad"                          
## [11] "\n Santino Fontana\n          "    
## [12] "Santino Fontana"                   
## [13] "\n Alan Tudyk\n          "         
## [14] "Alan Tudyk"                        
## [15] "\n Ciarán Hinds\n          "       
## [16] "Ciarán Hinds"                      
## [17] "\n Chris Williams\n          "     
## [18] "Chris Williams"                    
## [19] "\n Stephen J. Anderson\n          "
## [20] "Stephen J. Anderson"               
## [21] "\n Maia Wilson\n          "        
## [22] "Maia Wilson"                       
## [23] "\n Edie McClurg\n          "       
## [24] "Edie McClurg"                      
## [25] "\n Robert Pine\n          "        
## [26] "Robert Pine"                       
## [27] "\n Maurice LaMarche\n          "   
## [28] "Maurice LaMarche"                  
## [29] "\n Livvy Stubenrauch\n          "  
## [30] "Livvy Stubenrauch"
```

```r
cast3 <- html_nodes(frozen, ".itemprop .itemprop")
html_text(cast3)
```

```
##  [1] "Kristen Bell"        "Tommy Lioutas"       "Idina Menzel"       
##  [4] "Jonathan Groff"      "Josh Gad"            "Santino Fontana"    
##  [7] "Alan Tudyk"          "Ciarán Hinds"        "Chris Williams"     
## [10] "Stephen J. Anderson" "Maia Wilson"         "Edie McClurg"       
## [13] "Robert Pine"         "Maurice LaMarche"    "Livvy Stubenrauch"
```


```r
kw <- read_html("http://www.bestplaces.net/cost_of_living/city/florida/key_west")
kw %>% 
  html_nodes("#mainContent_dgCostOfLiving tr:nth-child(2) td:nth-child(2)") %>%
  html_text()
```

```
## [1] "171"
```


```r
cost_stats <- html_nodes(kw, css = "table")
living_cost <- html_table(cost_stats, header = TRUE)[[2]]
str(living_cost)
```

```
## 'data.frame':	7 obs. of  3 variables:
##  $   COST OF LIVING : chr  "  Overall  " "  Grocery  " "  Health  " "  Housing  " ...
##  $ Key West, Florida: num  171 103 102 319 97 ...
##  $ United States    : int  100 100 100 100 100 100 100
```


```r
kw2 <- read_html("http://www.bestplaces.net/climate/city/florida/key_west")
clm_stats <- html_nodes(kw2, css = "table")
climate_data <- html_table(clm_stats, header = TRUE)[[2]]
str(climate_data)
```

```
## 'data.frame':	9 obs. of  3 variables:
##  $   CLIMATE        : chr  "  Rainfall (in.)  " "  Snowfall (in.)  " "  Precipitation Days  " "  Sunny Days  " ...
##  $ Key West, Florida: num  44.2 0 101 260 89.4 64 94 7.2 6
##  $ United States    : chr  "39.2" "25.8" "102" "205" ...
```
