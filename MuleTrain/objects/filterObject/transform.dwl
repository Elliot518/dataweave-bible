%dw 2.0
output json
---
payload filterObject (value, key, index) -> (not (key as String contains "secret")) and (not value ~= false) 