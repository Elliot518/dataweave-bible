%dw 2.0
output application/json
---
payload.users.*user map (item, index) -> {
    fname: item.@firstname,
    lname: item.lastname
}
