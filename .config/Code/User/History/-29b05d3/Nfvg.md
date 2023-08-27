> We want to loop only on numbers from 8 to 10, can you use the dot command to do that?

```js
let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

let len = nums.length;

for (let i = 0; i < len; i++) {
  console.log(`nums[${i}] = ${nums[i]}`);
}
```

> The following code try to rewrite the previous example but in bash, can you fix the list?

```bash

nums=(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

i=0

for num in ${nums[@]}; do
    echo "nums[$i] = $num"
    ((i++))
done

```

> The following code will not compile, because there is missing `,` in the match body so can we fix it utilizing the dot command?

```rs

let dice_roll = 9;

match dice_roll {
    1 => one()
    2 => two()
    3 => three()
    4 => four()
    5 => five()
    6 => six()
    _ => other()
}

fn one() {}
fn two() {}
fn three() {}
fn four() {}
fn five() {}
fn six() {}
fn other() {}

```

> can you delte all z's from the follwoing code using the dot command and visual block mode?

```js

zlet zzone = "1";
zlet zztwo = "2";
zlet zzthree = "3";

let four = "4";

```