%dw 2.0
output application/xml
---
flights: {(
    payload map (item, index) -> {
        'flight$(index)': item
    }
)}
