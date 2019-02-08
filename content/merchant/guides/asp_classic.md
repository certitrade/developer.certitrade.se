---
title: "ASP Classic"
date: "2019-02-07"
weight: 70
menu: 
    main:
        parent: merchant-guides
---

Vill man använda ASP Classic går det att installera .NET-biblioteket ovan som ett COM+-objekt, på maskinen man vill köra på, och sedan anropa det.

I ASP Classic underlättar det också att använda det externa JSON-bibliotek aspJSON, [http://www.aspjson.com](http://www.aspjson.com/), när man ska hantera API-svaret.

# Gör biblioteket tillgängligt från din kod

Ta den resulterande dll:en från projektet, `CertiTrade.dll`, och lägg på en lämplig plats. Regitrera den sedan som en COM+-tjänst:

I windowskonsollen kör följande kommandon (`regasm` och `regsvcs` hittas i `C:\Windows\Microsoft.NET\Framework[64]\[version]\`):

```cmd
regasm.exe /tlb /codebase "C:\path\to\CertiTrade.dll"

regsvcs.exe "C:\path\to\CertiTrade.dll"
```

Starta nu comexp.msc (startmenyn -> kör...) och verifiera att "CertiTrade Merchant API" ligger under "COM+ Applications".

Gör man ändringar i C#-koden och komplierar om måste man eventuellt avregistrera dll:en med;

```cmd
regsvcs.exe /uninstall "C:\path\to\CertiTrade.dll"
```

eller från Managementmodulen (comexp.msc) innan man kan kompilera om projektet. Glöm inte att registrera den på nytt.

# Skapa ett `CTServer`-objekt

Efter att man registrerat dll:en som en COM+-tjänst är det bara att skapa ett objekt

```vb
Dim ctServer
Set ctServer = Server.CreateObject("CertiTrade.CTServer")

ctServer.setCredentials "<merchant id>", "<API key>", true
```

(det sista argumentet sätter om man ska till test- (`true`) eller produktionsmiljö (`false`)). Detta går sedan att anropa.

# Anropa API:et

```vb
Dim ctResponse
Set ctResponse = ctServer.createCardPayment("SEK", "http://myshop.tld/return", "http://myshop.tld/callback", 1000)
```

# Hantera API-svaret

Svaret man får av API:et är uppdelat i fyra delar:

```vb
ctResponse.Success(), ctResponse.HTTPStatus(), ctResponse.HTTPMessage() och ctResponse.HTTPBody().
```

De tre första kan användas rakt av medan `HTTPBody` är ett `CTResponse`-objekt. För att underlätta hanteringen av svaret finns hjälpfunktionen `getHTTPBodyString()` som returnerar hela `HTTPBody` som en sträng istället som kan skjutas in i vårt aspJSON-bibliotek.

```vb
Set JSONBody = new aspJSON
Dim httpBodyString
httpBodyString = ctResponse.getHTTPBodyString()
JSONBody.loadJSON(httpBodyString)
```

hela API-svaret går nu att få ut:

```vb
Response.Write("<b>Response.HTTPBody:</b> " & JSONBody.JSONoutput() & "<br><br>")
```

och individuella värden går att adressera på följande sätt:

```vb
JSONBody.data("id") ' För att få fram Payment-id:t
JSONBody.data("_links").item("paywin").item("href") ' För att få PayWin-länken
```