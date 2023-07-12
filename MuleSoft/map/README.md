[Back](../README.md)

<hr>

## Table of Contents


**Xml**

- [Map Array Elements](#mapArrayElements)

&nbsp;

### mapArrayElements
>Map each elements in an array.

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleSoft/map%2FmapArrayElements?202307111200"><img width="300" src="/images/dwplayground-button.png"><a>

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

