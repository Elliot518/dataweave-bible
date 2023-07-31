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




