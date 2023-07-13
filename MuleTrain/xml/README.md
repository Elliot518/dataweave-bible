[Back](../README.md)

<hr>

## Table of Contents

**Transform Arrays**
- [Xml Mapping](#xmlMap)
- [Repeat Elements](#repeatElements)


&nbsp;

### xmlMap

```
When mapping array elements (JSON or JAVA) to XML, wrap the map function in {( ... )}
  –{} are defining the object 
  –() are transforming each element in the array as a key/value pair
```

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleTrain/xml%2FxmlMap"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
[
    {
      "airline": "United",
      "flightCode": "ER38sd",
      "fromAirportCode": "LAX",
      "toAirportCode": "SFO",
      "departureDate": "May 21, 2016",
      "emptySeats": 0,
      "totalSeats": 200,
      "price": 199,
      "planeType": "Boeing 737"
    },
    {
      "airline": "Delta",
      "flightCode": "ER0945",
      "fromAirportCode": "PDX",
      "toAirportCode": "CLE",
      "departureDate": "June 1, 2016",
      "emptySeats": 24,
      "totalSeats": 350,
      "price": 450,
      "planeType": "Boeing 747"
    }
]
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output application/xml
---
flights: {(
    payload map (item, index) -> {
        'flight$(index)': item
    }
)}
```
</details>

<details>
<summary>Output</summary>

```json

```
</details>

<hr>

### repeatElements

>Use .* selector to reference repeated elements

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleTrain/xml%2FrepeatElements?20230712120012"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
<users>
  <user firstname="Max">
    <lastname>Mule</lastname>
  </user>
  <user firstname="Molly">
    <lastname>Jennet</lastname>
  </user>
</users>
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output application/json
---
payload.users.*user map (item, index) -> {
    fname: item.@firstname,
    lname: item.lastname
}
```
</details>

<details>
<summary>Output</summary>

```json

```
</details>

<hr>






