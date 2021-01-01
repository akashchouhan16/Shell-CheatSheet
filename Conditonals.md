# Shell Scripting Sheet

## **Conditionals Statements**

- **Syntax :**

```bash
 if [ condition ]
then
   echo Statement
fi
```

> ### **Integer Comparisons**

- **-eq** : is equal to
  - ```bash
      if [ "$num1" -eq "$num2" ]
    ```
- **-ne** : is not equal to

  - ```bash
        if [ "$a" -ne "$b" ]

    ```

- **-ge** : if one number is greater than or equal to a number

  - ```bash
     if [ "$n1" -ge "$n2" ]

    (true if n1greater then or equal to n2, else false)
    ```

- Other Commonly Used are :
  1. **-le** : compare if one number is less than or equal to a number
  1. **-ne** : compare if two numbers are not equal
  1. **-gt** : compare if one number is greater than another number
  1. **-lt** : compare if one number is less than another number

* **Syntax 2:**
  - ```bash
     if (( "$a" < "$b" ))
     then
         echo statement
    ```
  - ```bash
      if (( "$a" > "$b" ))
      then
           echo statement
    ```
  - ```bash
      if (( "$a" >= "$b" ))
      then
          echo statement
    ```

---

<br/>

> ### **String Comparisons**

- **= :** compare if two strings are equal
- **!= :** compare if two strings are not equal
- **-n :** evaluate if string length is greater than zero
- **-z :** evaluate if string length is equal to zero
- > Examples :
  - [ s1 = s2 ] (true if s1 same as s2, else false)
  - [ s1 != s2 ] (true if s1 not same as s2, else false)
  - [ s1 ] (true if s1 is not empty, else false)
  - [ -n s1 ] (true if s1 has a length greater then 0, else false)
  - [ -z s2 ] (true if s2 has a length of 0, otherwise false) git
