# string

HX: a string is a null-terminated arrayref of characters


## tk

sortdef tk = tkind

### example

```
```

### output

```
```

## SHR

typedef SHR(a:type) = a // for commenting purpose

### example

```
```

### output

```
```

## NSH

typedef NSH(a:type) = a // for commenting purpose

### example

```
```

### output

```
```

## stringLt

typedef stringLt (n:int) = [k:nat | k < n] string (k)

### example

```
```

### output

```
```

## stringLte

typedef stringLte (n:int) = [k:nat | k <= n] string (k)

### example

```
```

### output

```
```

## stringGt

typedef stringGt (n:int) = [k:int | k > n] string (k)

### example

```
```

### output

```
```

## stringGte

typedef stringGte (n:int) = [k:int | k >= n] string (k)

### example

```
```

### output

```
```

## stringBtw

typedef stringBtw (m:int, n:int) = [k:int | m <= k; k < n] string (k)

### example

```
```

### output

```
```

## stringBtwe

typedef stringBtwe (m:int, n:int) = [k:int | m <= k; k <= n] string (k)

### example

```
```

### output

```
```

## stringlst

typedef stringlst = List0 (string)

### example

```
```

### output

```
```

## stringlst\_vt

vtypedef stringlst\_vt = List0\_vt (string)


### example

```
```

### output

```
```

## string\_index\_p

dataprop
string_index_p
(
  n: int, int(*i*), int(*c*)
) =
  | string_index_p_eqz (n, n, 0)
  | {i:int | n > i}
    {c:int8 | c != 0}
    string_index_p_neqz (n, i, c)


# StringSubscriptExn

exception StringSubscriptExn of ((*void*))

### example

```
```

### output

```
```

## lemma\_string\_param
praxi
lemma_string_param{n:int}(string n): [n >= 0] void


### example

```
```

### output

```
```

## string2ptr

castfn
string2ptr (x: string):<> Ptr1
overload ptrcast with string2ptr


### example

```
```

### output

```
```

## string1\_of\_string0

//
// HX: [string2string] = [string1_of_string0]
//

### example

```
```

### output

```
```

## g0ofg1_string

castfn g0ofg1_string (x: String):<> string

### example

```
```

### output

```
```

## g1ofg0_string

castfn g1ofg0_string (x: string):<> String0


### example

```
```

### output

```
```

## g0ofg1

overload g0ofg1 with g0ofg1_string // index-erasing

### example

```
```

### output

```
```

## g1ofg0

overload g1ofg0 with g1ofg0_string // index-inducing

### example

```
```

### output

```
```

## string_sing

fun{}
string_sing (c: charNZ):<!wrt> strnptr (1)

### example

```
```

### output

```
```

## string\_is\_empty

fun{
} string\_is\_empty{n:int} (str: string(n)):<> bool(n==0)

### example

```
```

### output

```
```

## string\_isnot\_empty

fun{
} string\_isnot\_empty{n:int} (str: string(n)):<> bool(n > 0)

### example

```
```

### output

```
```

## string\_is\_atend

symintr string\_is\_atend

### example

```
```

### output

```
```

## string\_is\_atend\_size

fun{}
string\_is\_atend\_size
  {n:int}{i:nat | i <= n}
  (s: string (n), i: size\_t (i)):<> bool (i==n)

### example

```
```

### output

```
```

## string\_is\_atend\_gint

fun{tk:tk}
string\_is\_atend\_gint
  {n:int}{i:nat | i <= n}
  (s: string (n), i: g1int (tk, i)):<> bool (i==n)

### example

```
```

### output

```
```

## string\_is\_atend

overload string\_is\_atend with string\_is\_atend\_gint

### example

```
```

### output

```
```

## string\_is\_atend\_guint

fun{tk:tk}
string\_is\_atend\_guint
  {n:int}{i:nat | i <= n}
  (s: string (n), i: g1uint (tk, i)):<> bool (i==n)

### example

```
```

### output

```
```

## string\_is\_atend

overload string\_is\_atend with string\_is\_atend\_guint

### example

```
```

### output

```
```

## string\_isnot\_atend

macdef
string\_isnot\_atend
  (string, index) = ~string\_is\_atend (,(string), ,(index))

### example

```
```

### output

```
```

## string\_head

fun{
} string\_head{n:pos} (str: string(n)):<> charNZ

### example

```
```

### output

```
```

## string\_tail

fun{
} string\_tail{n:pos} (str: string(n)):<> string(n-1)

### example

```
```

### output

```
```

## string\_get\_at\_size

fun{}
string\_get\_at\_size
  {n:int}{i:nat | i < n}
  (s: string (n), i: size\_t (i)):<> charNZ

### example

```
```

### output

```
```

## string\_get\_at\_gint

fun{tk:tk}
string\_get\_at\_gint
  {n:int}{i:nat | i < n}
  (s: string (n), i: g1int (tk, i)):<> charNZ

### example

```
```

### output

```
```

## string\_get\_at\_guint


fun{tk:tk}
string\_get\_at\_guint
  {n:int}{i:nat | i < n}
  (s: string (n), i: g1uint (tk, i)):<> charNZ

### example

```
```

### output

```
```

## 

symintr string\_get\_at

### example

```
```

### output

```
```

## 

overload string\_get\_at with string\_get\_at\_size of 1

### example

```
```

### output

```
```

## 

overload string\_get\_at with string\_get\_at\_gint of 0

### example

```
```

### output

```
```

## 

overload string\_get\_at with string\_get\_at\_guint of 0

### example

```
```

### output

```
```

## 

fun{}
string\_test\_at\_size
  {n:int}{i:nat | i <= n}
  (s: string (n), i: size\_t (i)):<> [c:int] (string\_index\_p (n, i, c) | char (c))

### example

```
```

### output

```
```

## 

fun{tk:tk}
string\_test\_at\_gint
  {n:int}{i:nat | i <= n}
  (s: string (n), i: g1int (tk, i)):<> [c:int] (string\_index\_p (n, i, c) | char (c))

### example

```
```

### output

```
```

## 

fun{tk:tk}
string\_test\_at\_guint
  {n:int}{i:nat | i <= n}
  (s: string (n), i: g1uint (tk, i)):<> [c:int] (string\_index\_p (n, i, c) | char (c))

### example

```
```

### output

```
```

## 

symintr string\_test\_at

### example

```
```

### output

```
```

## 

overload string\_test\_at with string\_test\_at\_size of 1

### example

```
```

### output

```
```

## 

overload string\_test\_at with string\_test\_at\_gint of 0

### example

```
```

### output

```
```

## 

overload string\_test\_at with string\_test\_at\_guint of 0

### example

```
```

### output

```
```

## 

fun lt\_string\_string
  (x1: string, x2: string):<> bool = "mac#%"

### example

```
```

### output

```
```

## 

overload < with lt\_string\_string

### example

```
```

### output

```
```

## 

fun lte\_string\_string
  (x1: string, x2: string):<> bool = "mac#%"

### example

```
```

### output

```
```

## 

overload <= with lte\_string\_string

### example

```
```

### output

```
```

## 

fun gt\_string\_string
  (x1: string, x2: string):<> bool = "mac#%"

### example

```
```

### output

```
```

## 

overload > with gt\_string\_string

### example

```
```

### output

```
```

## 

fun gte\_string\_string
  (x1: string, x2: string):<> bool = "mac#%"

### example

```
```

### output

```
```

## 

overload >= with gte\_string\_string

### example

```
```

### output

```
```

## 

fun eq\_string\_string
  (x1: string, x2: string):<> bool = "mac#%"

### example

```
```

### output

```
```

## 

overload = with eq\_string\_string

### example

```
```

### output

```
```

## 

fun neq\_string\_string
  (x1: string, x2: string):<> bool = "mac#%"

### example

```
```

### output

```
```

## 

overload != with neq\_string\_string

### example

```
```

### output

```
```

## 

overload <> with neq\_string\_string

### example

```
```

### output

```
```

## 

fun compare\_string\_string
  (x1: string, x2: string):<> Sgn = "mac#%"

### example

```
```

### output

```
```

## 

overload compare with compare\_string\_string

### example

```
```

### output

```
```

## 

fun{
} strcmp (x1: string, x2: string):<> int

### example

```
```

### output

```
```

## 

fun{
} strintcmp
  {n1,n2:int | n2 >=0}
  (x1: string n1, n2: int n2):<> int(sgn(n1-n2))

### example

```
```

### output

```
```

## 

fun{
} strlencmp
  {n1,n2:int}
  (x1: string n1, x2: string n2):<> int(sgn(n1-n2))

### example

```
```

### output

```
```

## 

fun{}
string\_make\_list
  {n:int} (cs: list(charNZ, n)):<!wrt> strnptr (n)

### example

```
```

### output

```
```

## 

fun{}
string\_make\_listlen
  {n:int} (cs: list(charNZ, n), n: int n):<!wrt> strnptr (n)

### example

```
```

### output

```
```

## 

fun{
} string\_make\_rlist
  {n:int} (cs: list(charNZ, n)):<!wrt> strnptr (n)

### example

```
```

### output

```
```

## 

fun{
} string\_make\_rlistlen
  {n:int} (cs: list(charNZ, n), n: int n):<!wrt> strnptr (n)

### example

```
```

### output

```
```

## 

fun{
} string\_make\_substring
  {n:int}{st,ln:nat | st+ln <= n}
  (str: string (n), st: size\_t st, ln: size\_t ln):<!wrt> strnptr (ln)

### example

```
```

### output

```
```

## 

fun print\_string (x: string): void = "mac#%"

### example

```
```

### output

```
```

## 

fun prerr\_string (x: string): void = "mac#%"

### example

```
```

### output

```
```

## 

fun fprint\_string (out: FILEref, x: string): void = "mac#%"

### example

```
```

### output

```
```

## 

fun fprint\_substring
  {n:int}{st,ln:nat | st+ln <= n}
(
  out: FILEref, str: string(n), st: size\_t(st), ln: size\_t(ln)
) : void = "mac#%" // end of [fprint\_substring]

### example

```
```

### output

```
```

## 

fun{
} strchr{n:int}
  (str: string (n), c0: char):<> ssizeBtwe (~1, n)

### example

```
```

### output

```
```

## 

fun{
} strrchr{n:int}
  (str: string (n), c0: char):<> ssizeBtwe (~1, n)

### example

```
```

### output

```
```

## 

fun{
} strstr{n:int}
  (haystack: string (n), needle: string):<> ssizeBtw (~1, n)

### example

```
```

### output

```
```

## 

fun{
} strspn{n:int} // spanning
  (str: string (n), accept: string):<> sizeLte (n)

### example

```
```

### output

```
```

## 

fun{
} strcspn{n:int} // complement spanning
  (str: string (n), accept: string):<> sizeLte (n)

### example

```
```

### output

```
```

## 

fun{
} string\_index{n:int}
  (str: string (n), c0: charNZ):<> ssizeBtw (~1, n)

### example

```
```

### output

```
```

## 

fun{
} string\_rindex{n:int}
  (str: string (n), c0: charNZ):<> ssizeBtw (~1, n)

### example

```
```

### output

```
```

## 

symintr strlen

### example

```
```

### output

```
```

## 

symintr string\_length

### example

```
```

### output

```
```

## 

fun{
} string0\_length
  (x: NSH(string)):<> size\_t

### example

```
```

### output

```
```

## 

fun{
} string1\_length
  {n:int} (x: NSH(string(n))):<> size\_t(n)

### example

```
```

### output

```
```

## 

overload strlen with string0\_length of 0

### example

```
```

### output

```
```

## 

overload strlen with string1\_length of 10

### example

```
```

### output

```
```

## 

overload string\_length with string0\_length of 0

### example

```
```

### output

```
```

## 

overload string\_length with string1\_length of 10

### example

```
```

### output

```
```

## 

symintr string\_nlength

### example

```
```

### output

```
```

## 

fun{
} string0\_nlength
  (x: NSH(string), n: size\_t):<> size\_t

### example

```
```

### output

```
```

## 

fun{
} string1\_nlength
  {n1,n2:int}
  (NSH(string(n1)), size\_t(n2)):<> size\_t(min(n1,n2))

### example

```
```

### output

```
```

## 

overload string\_nlength with string0\_nlength of 0

### example

```
```

### output

```
```

## 

overload string\_nlength with string1\_nlength of 10

### example

```
```

### output

```
```

## 

fun{
} string0\_copy
  (xs: NSH(string)):<!wrt> Strptr1

### example

```
```

### output

```
```

## 

fun{
} string1\_copy
  {n:int} (xs: NSH(string(n))):<!wrt> strnptr (n)

### example

```
```

### output

```
```

## 

symintr string\_append

### example

```
```

### output

```
```

## 

fun{
} string0\_append
(
  x1: NSH(string), x2: NSH(string)
) :<!wrt> Strptr1 // end-of-fun

### example

```
```

### output

```
```

## 

fun{
} string1\_append
  {n1,n2:int} (
  x1: NSH(string(n1)), x2: NSH(string(n2))
) :<!wrt> strnptr (n1+n2) // end of [string1\_append]

### example

```
```

### output

```
```

## 

overload string\_append with string0\_append of 0

### example

```
```

### output

```
```

## 

(*
overload string\_append with string1\_append of 20
*)

### example

```
```

### output

```
```

## 

symintr string\_append3

### example

```
```

### output

```
```

## 

fun{
} string0\_append3
(
  x1: NSH(string), x2: NSH(string), x3: NSH(string)
) :<!wrt> Strptr1 // end-of-fun

### example

```
```

### output

```
```

## 

overload string\_append3 with string0\_append3 of 0

### example

```
```

### output

```
```

## 

fun{
} stringarr\_concat{n:int}
  (xs: arrayref(string, n), size\_t n):<!wrt> Strptr1

### example

```
```

### output

```
```

## 

fun{
} stringlst\_concat (xs: List(string)):<!wrt> Strptr1

### example

```
```

### output

```
```

## 

fun{
} string\_explode
  {n:int} (x: string(n)):<!wrt> list\_vt (charNZ, n)

### example

```
```

### output

```
```

## 

fun{
} string\_tabulate$fopr (size\_t): charNZ

### example

```
```

### output

```
```

## 

fun{
} string\_tabulate{n:int} (n: size\_t(n)): strnptr(n)

### example

```
```

### output

```
```

## 

fun{env:vt0p}
string\_foreach$cont (c: char, env: &env): bool

### example

```
```

### output

```
```

## 

fun{env:vt0p}
string\_foreach$fwork (c: char, env: &(env) >> \_): void

### example

```
```

### output

```
```

## 

fun{
} string\_foreach {n:int} (str: string(n)): sizeLte(n)

### example

```
```

### output

```
```

## 

fun{
env:vt0p
} string\_foreach\_env
  {n:int} (str: string(n), env: &(env) >> \_): sizeLte(n)

### example

```
```

### output

```
```

## 

fun{env:vt0p}
string\_rforeach$cont (c: char, env: &env): bool

### example

```
```

### output

```
```

## 

fun{env:vt0p}
string\_rforeach$fwork (c: char, env: &(env) >> \_): void

### example

```
```

### output

```
```

## 

fun{
} string\_rforeach {n:int} (str: string(n)): sizeLte(n)

### example

```
```

### output

```
```

## 

fun{
env:vt0p
} string\_rforeach\_env
  {n:int} (str: string(n), env: &(env) >> \_): sizeLte(n)

### example

```
```

### output

```
```

## 

(*
** HX: [stropt\_none] is just the null pointer
*)
fun stropt\_none (): stropt (~1) = "mac#%"

### example

```
```

### output

```
```

## 

symintr stropt\_some

### example

```
```

### output

```
```

## 

castfn stropt0\_some (x: SHR(string)): Stropt1

### example

```
```

### output

```
```

## 

overload stropt\_some with stropt0\_some of 0

### example

```
```

### output

```
```

## 

castfn stropt1\_some {n:int} (x: SHR(string n)): stropt (n)

### example

```
```

### output

```
```

## 

overload stropt\_some with stropt1\_some of 10

### example

```
```

### output

```
```

## 

fun{
} stropt\_is\_none{n:int} (stropt(n)):<> bool (n < 0)

### example

```
```

### output

```
```

## 

fun{
} stropt\_is\_some{n:int} (stropt(n)):<> bool (n >= 0)

### example

```
```

### output

```
```

## 

castfn
stropt\_unsome {n:nat} (x: stropt n):<> string (n)

### example

```
```

### output

```
```

## 

fun{
} stropt\_length
  {n:int} (x: stropt (n)):<> ssize\_t (n)

### example

```
```

### output

```
```

## 

fun print\_stropt (opt: Stropt0): void = "mac#%"

### example

```
```

### output

```
```

## 

fun prerr\_stropt (opt: Stropt0): void = "mac#%"

### example

```
```

### output

```
```

## 

fun fprint\_stropt (out: FILEref, opt: Stropt0): void = "mac#%"

### example

```
```

### output

```
```

## 

// overloading for certain symbols

### example

```
```

### output

```
```

## 

overload
[] with string\_get\_at\_size of 1

### example

```
```

### output

```
```

## 

overload
[] with string\_get\_at\_gint of 0

### example

```
```

### output

```
```

## 

overload
[] with string\_get\_at\_guint of 0

### example

```
```

### output

```
```

## 

overload iseqz with string\_is\_empty

### example

```
```

### output

```
```

## 

overload isneqz with string\_isnot\_empty

### example

```
```

### output

```
```

## 

overload .head with string\_head

### example

```
```

### output

```
```

## 

overload .tail with string\_tail

### example

```
```

### output

```
```

## 

overload length with string\_length

### example

```
```

### output

```
```

## 

overload copy with string0\_copy of 0

### example

```
```

### output

```
```

## 

(*
//
// HX: too much of a surprise!
//
overload copy with string1\_copy of 10
*)

### example

```
```

### output

```
```

## 

overload print with print\_string of 0

### example

```
```

### output

```
```

## 

overload prerr with prerr\_string of 0

### example

```
```

### output

```
```

## 

overload fprint with fprint\_string of 0

### example

```
```

### output

```
```

## 

overload iseqz with stropt\_is\_none

### example

```
```

### output

```
```

## 

overload isneqz with stropt\_is\_some

### example

```
```

### output

```
```

## 

overload length with stropt\_length

### example

```
```

### output

```
```

## 

overload print with print\_stropt of 0

### example

```
```

### output

```
```

## 

overload prerr with prerr\_stropt of 0

### example

```
```

### output

```
```

## 

overload fprint with fprint\_stropt of 0