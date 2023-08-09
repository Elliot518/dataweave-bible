[Back](../README.md)

<hr>

## Table of Contents

**Join**
- [Join](#join)

&nbsp;

### join


Joins two arrays of objects by a given ID criteria.
(inner join)


<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleSoft/join%2Fjoin"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
import * from dw::core::Arrays
var users = [{id: "1", name:"Mariano"},{id: "2", name:"Leandro"},{id: "3", name:"Julian"},{id: "5", name:"Julian"}]
var products = [{ownerId: "1", name:"DataWeave"},{ownerId: "1", name:"BAT"}, {ownerId: "3", name:"DataSense"}, {ownerId: "4", name:"SmartConnectors"}]
output application/json
---
join(users, products, (user) -> user.id, (product) -> product.ownerId)
```
</details>

<details>
<summary>Output</summary>

```json
[
  {
    "l": {
      "id": "1",
      "name": "Mariano"
    },
    "r": {
      "ownerId": "1",
      "name": "DataWeave"
    }
  },
  {
    "l": {
      "id": "1",
      "name": "Mariano"
    },
    "r": {
      "ownerId": "1",
      "name": "BAT"
    }
  },
  {
    "l": {
      "id": "3",
      "name": "Julian"
    },
    "r": {
      "ownerId": "3",
      "name": "DataSense"
    }
  }
]
```
</details>

<hr>



