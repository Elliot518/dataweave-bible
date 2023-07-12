[Back](../README.md)

<hr>

## Table of Contents


**Xml**

- [Retrieve Element](#retrieveElement)
- [Index Selector](#indexSelector)

&nbsp;

### retrieveElement

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleSoft/xml%2FretrieveElement"><img width="300" src="/images/dwplayground-button.png"><a>

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

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleSoft/xml%2FindexSelector?202307111200"><img width="300" src="/images/dwplayground-button.png"><a>

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