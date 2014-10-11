open Printf;;
open List;;
let (b:int) = 2;;
let a = 1;;
let (f0:(unit)->(int)) = (fun ( ()) -> 0;
);;
printf("%d\n")(f0(()));;
printf("%d\n") (f0(()));;
printf("%d\n") (f0(()));;
let (f1:(int)->(int)) = (fun ( a) -> a;
);;
printf("%d\n")(f1(1));;
printf("%d\n") (f1(1));;
printf("%d\n") (f1(1));;
let (f2:(int)->((int)->(int))) = (fun ( a) ( b) -> (a + b);
);;
printf("%d\n")(f2(1)(2));;
printf("%d\n") (f2(1) (2));;
printf("%d\n") (f2(1) (2));;
let (f3:(int)->((int)->((int)->(int)))) = (fun ( a) ( b) ( c) -> ((a + b) + c);
);;
printf("%d\n")(f3(1)(2)(3));;
printf("%d\n") (f3(1) (2) (3));;
printf("%d\n") (f3(1) (2) (3));;
printf("%d %d %d %d\n")(f0(()))(f1(1))(f2(1)(2))(f3(1)(2)(3));;
printf("%d %d %d %d\n") (f0(())) (f1(1)) (f2(1) (2)) (f3(1) (2) (3));;
printf("%d %d %d %d\n") (f0(())) (f1(1)) (f2(1) (2)) (f3(1) (2) (3));;
printf("%d\n")(f3((- 1))((- 2))((- 3)));;
printf("%d\n") (f3((- 1)) ((- 2)) ((- 3)));;
printf("%d\n") (f3((- 1)) ((- 2)) ((- 3)));;
printf("%d+%d=%d\n")(a)(b)((a + b));;
printf("%d+%d=%d\n") (a) (b) ((a + b));;
printf("%d+%d=%d\n") (a) (b) ((a + b));;
printf((if (a < 1) then ("a\n")else("b1\n")));;
(if (a < 10) then (printf("b2\n");
););;
(if (a > 10) then (printf("a\n"))else(printf("b3\n")));;
let (add1:(int)->(int)) = (fun ( a) -> (a + 1);
);;
let c = add1(10);;
printf("10+1=%d\n") (c);;
printf("10+1=%d\n") (add1(10));;
let add = (fun ( a) ( b) -> (a + b);
);;
let (add3:(int)->((int)->((int)->(int)))) = (fun ( a) ( b) ( c) -> ((a + b) + c);
);;
let (addt:((int * int))->(int)) = (fun ( (a , b)) -> (a + b);
);;
let rec fib = (function | ( 0) -> (0;
)| ( 1) -> (1;
)| ( n) -> ((fib((n - 2)) + fib((n - 1)));
));;
let rec fib2 = (fun ( n) -> (match n with | ( 0) -> (0;
)| ( 1) -> (1;
)| ( n) -> ((fib2((n - 2)) + fib2((n - 1)));
));
);;
let llor = (function | ( (0 , 0)) -> (let a = 1 in
let b = 2 in
(a lor b);
)| ( (a , b)) -> ((a lor b);
));;
let main = (fun ( ()) -> printf("add 1 2 = %d\n") (add(1) (2));
printf("addt 1,2 = %d\n") (addt((1 , 2)));
printf("fib 10 = %d\n") (fib(10));
printf("llor %d\n") (llor((1 , 2)));
let a = 12 in
let c = 2 in
let b = (c + a) in
printf("%d\n") (b);
);;
main(());;
let (_:unit) = printf("test222\n");
iter((fun ( x) -> printf("%d\n") (x);
))([1; 2; 3; 4000]);
let ls = map((fun ( x) -> (x * 10);
))([1; 2; 3; 4; 5]) in
iter((fun ( x) -> printf("%d\n") (x);
))(ls);
iter((fun ( x) -> printf("%d\n") (x);
))(ls);
iter((fun ( x) -> printf("%d\n") (x);
)) (ls);
;;
type a = {x:int;y:int};;
let aa = {x=1;y=2};;
printf("%d\n") ((aa . x));;
printf("%d\n") (({x=1;y=2} . x));;
let aa = (fun ({x}) -> printf("%d\n") (x);
);;
type k = KInt of (int)|KAdd of (k * k);;
let rec eval = (function | ( KInt(i)) -> (i;
)| ( KAdd((a , b))) -> (let a = eval(a) in
let b = eval(b) in
(a + b);
));;
printf("1+2=%d\n") (eval(KAdd((KInt(1) , KInt(2)))));;
let f2 = (fun ( (a , b)) ( (c , d)) -> ((a * b) + (c * d));
);;
printf("%d\n")(f2((1 , 2))((3 , 4)));;
printf("%d\n") (f2((1 , 2)) ((3 , 4)));;
