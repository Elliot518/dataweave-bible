# dataweave-bible
MuleSoft DataWeave bible

<hr>

## Table of Contents

**Basic**
- [HelloWorld](#helloWorld)
- [Extract Data](#extractData)

&nbsp;

**Xml**

- [Retrieve Element](#retrieveElement)

&nbsp;

### helloWorld

Hello World of DataWeave


<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=basic%2FhelloWorld"><img width="300" src="/images/dwplayground-button.png"><a>

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

### extractData

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

&nbsp;

### retrieveElement

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=xml%2FretrieveElement"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
<language>
    <name>DataWeave</name>
    <version>2.0</version>
</language>
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output application/xml
---
{ newname : payload.language.name }
```
</details>

<details>
<summary>Output</summary>

```json
<?xml version='1.0' encoding='UTF-8'?>
<newname>DataWeave</newname>
```
</details>

<hr>

### indexSelector

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=xml%2FindexSelector"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
<root>
    <element>
        <subelement1>SE1</subelement1>
    </element>
    <element>E2</element>
</root>
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output application/xml
---
{ mysubelement : payload.root[0].subelement1 }
```
</details>

<details>
<summary>Output</summary>

```json
<?xml version='1.0' encoding='UTF-8'?>
<mysubelement>SE1</mysubelement>
```
</details>