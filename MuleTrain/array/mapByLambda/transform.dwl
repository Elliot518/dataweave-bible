%dw 2.0
output application/dw
---
payload map (item, index) -> {
    'flight$(index)': item
}


