%dw 2.0
output application/xml
---
{ 
    newRoot: {
        mysubelement : payload.root[0].subelement1,
        mysubelement2 : payload.root[1]
    }
}