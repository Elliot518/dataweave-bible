[Back](../README.md)

<hr>

## Table of Contents

**Transform Arrays**
- [filterObject](#filterObject)


&nbsp;

### filterObject

The filterObject function is similar to the filter function, but instead of removing items from Arrays, the filterObject function removes key-value pairs from Objects.
(Use the "similar to" operator (~=), instead of the "equal to" operator (==), as key ~= "age")

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleTrain/objects%2FfilterObject"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
{
    "name": "Jerry",
    "middle_name": false,
    "last_name": "Schumann",
    "secret_key": "903mg20mgg4",
    "secret_password": "d0n0tH4ckm3PLiZ",
    "question_secret": "Do you wish to get hacked?",
    "personal_token": false
}
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output json
---
payload filterObject (value, key, index) -> (not (key as String contains "secret")) and (not value ~= false) 
```
</details>

<details>
<summary>Output</summary>

```json

```
</details>

<hr>

### mapObject

mapObject transforms an Object to an new Object instead of an Array to a new Array. 

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleTrain/objects%2FmapObject"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
[
  {"First Name": "Max", "Last Name": "The Mule"},
  {"First Name": "Albert", "Last Name": "Einstein"}
]
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output json
---
payload map (item,index) -> (
	item mapObject (value, key, index) -> {
        (lower(key)): upper(value)
    }
)
// payload map (items,index) -> (
// 	items mapObject (
// 		(lower($$)):(upper($))
// 	)
// )
```
</details>

<details>
<summary>Output</summary>

```json
[
  {
    "first name": "MAX",
    "last name": "THE MULE"
  },
  {
    "first name": "ALBERT",
    "last name": "EINSTEIN"
  }
]
```
</details>

<hr>

### pluck

pluck takes as inputs an Object, and a lambda that accepts 3 parameters: a value, key, and number representing an index. 
This lambda can return any type. Whatever type the lambda returns is the same type for each item in the output Array.
```
Here’s an example of using pluck to take in an Object, and create an Array where each element is a single key-value pair from the input object:
Input:
{
  "firstName": "Avery",
  "lastName": "Chance",
  "age": 56,
  "occupation": "Physicist"
}

DW Script
%dw 2.0
output json
---
payload pluck (v,k,idx) -> {(k): v}

Output:
[
  {"firstName": "Avery"},
  {"lastName": "Chance"},
  {"age": 56},
  {"occupation": "Physicist"}
]
```
The pluck function is commonly used in conjunction with groupBy. This is because often times groupBy does exactly what the user wants in terms of grouping data, but the keys labelling the groups are not needed, and the user would rather have an Array of Arrays instead of an Object of Arrays.

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleTrain/objects%2Fpluck"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
[
  {
    "orderId"  : 1,
    "customer" : "Josh",
    "lineId"   : 1,
    "lineItem" : "Shoes",
    "price"    : 50
  },
  {
    "orderId"  : 1,
    "customer" : "Josh",
    "lineId"   : 2,
    "lineItem" : "Socks",
    "price"    : 20
  },
  {
    "orderId"  : 2,
    "customer" : "Mariano",
    "lineId"   : 3,
    "lineItem" : "Shirt",
    "price"    : 30
  },
  {
    "orderId"  : 2,
    "customer" : "Mariano",
    "lineId"   : 4,
    "lineItem" : "Jacket",
    "price"    : 80
  }
]
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output json
---
payload
    groupBy ((order, index) -> order.orderId)
    pluck ((order, id, index) -> order)
```
</details>

<details>
<summary>Output</summary>

```json
[
  [
    {
      "orderId": 1,
      "customer": "Josh",
      "lineId": 1,
      "lineItem": "Shoes",
      "price": 50
    },
    {
      "orderId": 1,
      "customer": "Josh",
      "lineId": 2,
      "lineItem": "Socks",
      "price": 20
    }
  ],
  [
    {
      "orderId": 2,
      "customer": "Mariano",
      "lineId": 3,
      "lineItem": "Shirt",
      "price": 30
    },
    {
      "orderId": 2,
      "customer": "Mariano",
      "lineId": 4,
      "lineItem": "Jacket",
      "price": 80
    }
  ]
]
```
</details>

<hr>
