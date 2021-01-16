# Loops in Shell

> ## While Loops

**Syntax :**

- ```bash
   while [ condition ]
   do
       ...Statements...
   done
  ```
- **Example :**
  ```bash
      myVar=1
      while [ $myVar -le 5 ]
      do
          echo “value of myVar=” $myVar
          a=`expr $myVar + 1`
      done
  ```

---

> ## Do-While loops / Until loops

**Syntax :**

- ```bash
    until [ condition ]
    do
        ...Statements...
    done
  ```
- **Example :**
  ```bash
  myVar=1
  until [ $myVar -ge 3 ]
  do
      echo “value of myVar=” $myVar
      myVar=`expr $myVar + 1`
  done
  ```

---

> ## for loops

**Syntax :**

- ```bash
    for variable in $(list): do
        Statement/commands
    done
  ```
- **Example :**
  ```bash
      for i in 1 2 3 4 5
      do
          sum=`expr $sum + $i`
      done
      echo $sum
  ```

---
