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
- [Index Selector](#indexSelector)

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
>If multiple child elements of the input have the same name, use the index to select the value of the child.

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=xml%2FindexSelector?202307111200"><img width="300" src="/images/dwplayground-button.png"><a>

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
{ 
    newRoot: {
        mysubelement : payload.root[0].subelement1,
        mysubelement2 : payload.root[1]
    }
}
```
</details>

<details>
<summary>Output</summary>

```json
<?xml version='1.0' encoding='UTF-8'?>
<newRoot>
  <mysubelement>SE1</mysubelement>
  <mysubelement2>E2</mysubelement2>
</newRoot>
```
</details>

&nbsp;

### mapArrayElements
>Map each elements in an array.

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=xml%2FmapArrayElements?202307111200"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
{
    "books": [
      {
        "-category": "cooking",
        "title":"Everyday Italian",
        "author": "Giada De Laurentiis",
        "year": "2005",
        "price": "30.00"
      },
      {
        "-category": "children",
        "title": "Harry Potter",
        "author": "J K. Rowling",
        "year": "2005",
        "price": "29.99"
      },
      {
        "-category": "web",
        "title":  "XQuery Kick Start",
        "author": [
          "James McGovern",
          "Per Bothner",
          "Kurt Cagle",
          "James Linn",
          "Vaidyanathan Nagarajan"
        ],
        "year": "2003",
        "price": "49.99"
      },
      {
        "-category": "web",
        "-cover": "paperback",
        "title": "Learning XML",
        "author": "Erik T. Ray",
        "year": "2003",
        "price": "39.95"
      }
    ]
}
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output application/json
---
items: payload.books map (item, index) -> {
      book: item mapObject (value, key) -> {
      (upper(key)): value
      }
}
```
</details>

<details>
<summary>Output</summary>

```json
{
  "items": [
    {
      "book": {
        "-CATEGORY": "cooking",
        "TITLE": "Everyday Italian",
        "AUTHOR": "Giada De Laurentiis",
        "YEAR": "2005",
        "PRICE": "30.00"
      }
    },
    {
      "book": {
        "-CATEGORY": "children",
        "TITLE": "Harry Potter",
        "AUTHOR": "J K. Rowling",
        "YEAR": "2005",
        "PRICE": "29.99"
      }
    },
    {
      "book": {
        "-CATEGORY": "web",
        "TITLE": "XQuery Kick Start",
        "AUTHOR": [
          "James McGovern",
          "Per Bothner",
          "Kurt Cagle",
          "James Linn",
          "Vaidyanathan Nagarajan"
        ],
        "YEAR": "2003",
        "PRICE": "49.99"
      }
    },
    {
      "book": {
        "-CATEGORY": "web",
        "-COVER": "paperback",
        "TITLE": "Learning XML",
        "AUTHOR": "Erik T. Ray",
        "YEAR": "2003",
        "PRICE": "39.95"
      }
    }
  ]
}
```
</details>