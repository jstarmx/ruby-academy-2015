# Test List

* One book
  [1] => £8

* Two different books
  [1,2] => £14.40

* Three different books
  [2,3,5] => £21.60

* Four different books
  [1,2,4,5] => £25.60

* Five different books
  [1,2,3,4,5] => £30

* Duplicate book not discounted
  [1,2,2] => £22.40

* Different duplicates are discounted
  [1,1,2,2] => £28.80
  [1,1,2,2,3,3,4,5] => £51.20
