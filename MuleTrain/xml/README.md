[Back](../README.md)

<hr>

## Table of Contents

**Transform Arrays**
- [Multi Values Selector](#multiValuesSelector)


&nbsp;

### multiValuesSelector

Select multiple values in an array.


<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleTrain/array%2FmultiValuesSelector"><img width="300" src="/images/dwplayground-button.png"><a>

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
output application/dw
---
payload.*price
```
</details>

<details>
<summary>Output</summary>

```json

```
</details>

<hr>




