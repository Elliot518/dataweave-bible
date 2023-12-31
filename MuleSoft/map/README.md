[Back](../README.md)

<hr>

## Table of Contents


**Map**

- [Map Array Elements](#mapArrayElements)
- [Map Flatten Array](#mapFlattenArray)

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

<hr>

### mapFlattenArray
>Map and Flatten an Array.

<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleSoft/map%2FmapFlattenArray?202307111200"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
[
  {
    "name": 1
  },
  {
    "name": 2
  },
  {
    "name": 3
  }
]
```
</details>

<details>
<summary>Script</summary>

```dataweave
%dw 2.0
output application/json
fun myExternalFunction(data): Array =
    if(data.name == 1)
        []
    else if(data.name == 2)
        [{name: 3}, {name:5}]
    else
        [data]
---
//payload map (item, index) -> myExternalFunction(item)
//flatten(payload map ((item, index) -> myExternalFunction(item)))
payload flatMap ((item, index) -> myExternalFunction(item))
```
</details>

<details>
<summary>Output</summary>

```json

```
</details>  

<hr>

### mapObjectsKey
>Use regular expression to match a key.
>
```
注: 正则表达式返回的是一个数组，第一个元素是整体匹配结果，然后是各个分组（括号里）匹配的内容。
(
  eg:
  [
    "(sheet)2", "2"
  ]
)
```


<a href="https://dataweave.mulesoft.com/learn/playground?projectMethod=GHRepo&repo=Elliot518%2Fdataweave-bible&path=MuleSoft/map%2FmapObjectsKey?202307111200"><img width="300" src="/images/dwplayground-button.png"><a>

<details>
<summary>Input</summary>

```json
{
	"(sheet)1": [{
		"Id": 1.0,
		"Team": "Mule",
		"timestamp": "2019-09-26T16:37:54",
		"Access": 12431
	}],
	"(sheet)2": [{
			"Id": 2.0,
			"Team": "Max",
			"timestamp": "2019-09-26T16:37:54",
			"Access": 81243
		},
		{
			"Id": 2.0,
			"Team": "Max Mule",
			"timestamp": "2019-09-26T18:00:54",
			"Access": 67676
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

var append =
    {
    "Id": "2",
    "Access": "4444",
    "Subteam": "1",
    }

fun extractNumber(pageName: Key) =
     (pageName as String match  /\(sheet\)([0-9]+)/)[1]
---
payload mapObject ((value, key, index) -> do {
        if(extractNumber(key) == append.Id)
            {(key): value << append}
         else
            {(key): value}
})
```
</details>

<details>
<summary>Output</summary>

```json

```
</details>  
