%dw 2.0
output application/dw
---
payload map {
    flight: $$,
    destination: $.toAirportCode
}
