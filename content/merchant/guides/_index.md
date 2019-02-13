---
title: "Certitrade Merchant API Guides"
date: "2019-02-07"
weight: 10
menu:
    main:
        parent: merchant
        identifier: merchant-guides
        name: Guides
---
# Introduktion

För att underlätta implementation av Certitrade:s MerchantAPI i din applikation har vi tagit fram ett API-bibliotek. Detta gränssnitt publicerar metoder för att interagera med Certitrade:s PSP-tjänst.

Detta dokument syftar till att i steg-för-steg förklara och underlätta användningen API-bibliotek:et för att du snabbt och enkelt ska kunna komma igång med PSP-tjänsten.

# Säkerhet

Merchant id och API key och hur de ska hanteras

# Översiktlig beskrivning

- Ladda ner och extrahera filerna samt lägg på en lämplig plats. Om det är fråga om en uppdatering, snarare än en nyimplementation, är det viktigt att läsa changelog:en för det aktuella versionsdeltat.
- Kontakta Certitrade för att få Merchant-id samt API-nycklar. Dessa behövs för att du ska kunna använda både testmiljön och produktionsmiljön.
- Inkludera biblioteket i din kod
- Läs noga igenom säkerhetskapitlet i API-dokumetationen.
- Instantiera ett CTServer-objekt och sätt dina användaruppgifter. Kom ihåg att använda testingflaggan tills du är redo att gå i produktion.
