---
title: "Other Languages"
date: "2019-02-08"
weight: 80
menu: 
    main:
        parent: merchant-guides
---
Om man använder ett språk som det saknas ett klientbibliotek för följer här en generell guide för implementation av CertiTrade:s MerchantAPI.

# Förutsättningar

För att underlätta implementationen av API:et behövs ett httpklientbibliotek. Det ska stödja  skapandet av en REST-begäran och man behöver även själv kunna ändra och sätta headers. Exempel på sådana för ett par vanliga språk är:

- **Classic ASP:** ServerXMLHTTP
- **Java:** HttpURLConnection, som är en del av SDK:n eller ett mer komplett externt bibliotek som Jersey eller Apache HttpClient
- **Python:** Requests

För att skapa och behandla API-begäran och -svar underlättar det även att ha tillgång till ett JSON-bibliotek. Exempel på sådana för några vanliga utvecklingsspråk är:

- **Classic ASP:** ASPJSON
- **Java:** in Java EE there is a JSON library and also a popular third party library called Jackson
- **Python:** part of the standard library in a module, intuitively, called json

Saknas någon av dessa går det förstås att implementera API:et i alla fall, men det kräver antagligen extra resurser.

1. [http://msdn.microsoft.com/en-us/library/ms762278%28v=vs.85%29.aspx](http://msdn.microsoft.com/en-us/library/ms762278(v=vs.85).aspx)
2. [http://docs.oracle.com/javase/7/docs/api/java/net/HttpURLConnection.html](http://docs.oracle.com/javase/7/docs/api/java/net/HttpURLConnection.html)
3. [https://jersey.java.net/](https://jersey.java.net/)
4. [https://hc.apache.org/httpcomponents-client-ga/](https://hc.apache.org/httpcomponents-client-ga/)
5. [http://docs.python-requests.org/en/latest/#](http://docs.python-requests.org/en/latest/)
6. [http://www.aspjson.com/](http://www.aspjson.com/)
7. [http://docs.oracle.com/javaee/7/api/javax/json/package-summary.html#package\_description](http://docs.oracle.com/javaee/7/api/javax/json/package-summary.html#package_description)
8. [https://github.com/FasterXML/jackson](https://github.com/FasterXML/jackson)
9. [https://docs.python.org/3/library/json.html](https://docs.python.org/3/library/json.html)
