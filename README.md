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


