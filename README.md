# dataweave-bible
MuleSoft DataWeave bible

<hr>

## Table of Contents

**Basic**
- [HelloWorld](#HelloWorld)

&nbsp;

### HelloWorld

Hello World of DataWeave


<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=basic%2FHelloWorld"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
{
    "message": "Hello world!"
}
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output application/json
---
payload.message
```
</details>

<details>
<summary>Output</summary>

```json
 "Hello world!"
```
</details>

<hr>

### Extract Data

xxx


<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=basic%2FextractData"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json

```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
var myObject = { "myKey" : "1234", "name" : "somebody" }
var myArray = [ { "myKey" : "1234" }, { "name" : "somebody" } ]
output application/json
---
{
    selectingValueUsingKeyInObject : myObject.name,
    selectingValueUsingKeyOfObjectInArray : myArray.name,
}
```
</details>

<details>
<summary>Output</summary>

```json
{
    "selectingValueUsingKeyInObject": "somebody",
    "selectingValueUsingKeyOfObjectInArray": [ "somebody" ]
}
```
</details>
