[Back](../README.md)

<hr>

## Table of Contents

**Define and using variables and functions**
- [Custom Data Type](#customDataType)


&nbsp;

### customDataType

>Define and use custom data type

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleTrain/dataType%2FcustomDataType"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
[
  {
    "airline": "United",
    "flightCode": "ER38sd",
    "fromAirportCode": "LAX",
    "toAirportCode": "SFO",
    "departureDate": "08-05-2023",
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
    "departureDate": "16-06-2023",
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
output application/json
type Currency = String {format: '###.00'}
---
flights: payload map (item, index) -> {
    dest: item.toAirportCode,
    price: item.price as Currency,
    totalSeats: item.totalSeats,
    plane: upper(item.planeType),
    date: item.departureDate as Date {format: 'dd-MM-yyyy'} as String {format: 'yyyy-MM-dd'}
}
```
</details>

<details>
<summary>Output</summary>

```json

```
</details>

<hr>









