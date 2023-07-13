%dw 2.0
output application/json
fun myFunc(object) = do {
    var fname = object.firstname
    var lname = object.lastname
    ---
    {
        person: do {
            var user = fname
            var color = "gray"
            ---
            {
                name: user,
                color: color
            }
        },
        name: lname
    }
}
---
myFunc(payload)
