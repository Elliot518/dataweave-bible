%dw 2.0
output application/xml
---
payload.user.*user map (item, index) -> {
    fname: item.@firstname,
    lname: item.lastname
}
