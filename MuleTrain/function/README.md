[Back](../README.md)

<hr>

## Table of Contents

**Define and using variables and functions**
- [Do Keyword](#doKeyword)


&nbsp;

### doKeyword

```
- Use the do keyword with the syntax
    do {<variable declaration header> ---<body>}
- Local variables can only be referenced from within the scope of the expression 
  where they are initialized
- do的大括号内部可以组织局部变量，作用域仅在大括号内部。
```

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleTrain/function%2FdoKeyword"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
{
  "firstname": "Max",
  "lastname": "Mule"
}
```
</details>

<details>
<summary>Script</summary>

```dataweave
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
```
</details>

<details>
<summary>Output</summary>

```json

```
</details>

<hr>









