# セグメントに別れたメモリ割り当て

いきなり、高速化されたビットマップGCを作ろうとするのは大変です。
ここは焦らずに、その手前の段階のGCを作ってみましょう。
高速化するためのポイントの１つはサイズを分けて管理する事です。
ヒープを複数に分けて、配列として用意しておいてそれを使います。
ヒープのサイズは、8,16,32,64,128,256,512,1024,2048,4096とそれ以上に分けます。
とりあえず、4096バイトまで扱う事が出来るメモリアロケータを作る事を考えましょう。
配列を作って用意しておくのは良いのですが、メモリサイズが大きくなった場合に困ります。
必要になってから付け足す事を考えると、
複数のセグメントは128kバイトと固定しておいて、リストで並べたものとしましょう。
足りなくなったら追加します。

128kのメモリ領域をOSのヒープから取得しセグメントと呼びましょう。
セグメント1個ずつは次のポインタセグメントのポインタを持ち、最後はNULLになります。

    typedef struct Seg {
      char data[128*1024];
      struct Seg* next;
    } Seg;

ヒープは、このセグメントの先頭アドレスをもっています。

    typedef struct Heap {
      Seg* S;
    } Heap;

また、セグメントを追加したいときにセグメントを辿るのは面倒なので、終了のセグメントも持ちましょう。

    typedef struct Heap {
      Seg* S_start;
      Seg* S_end;
    } Heap;

このヒープはH3〜H12と名前を付けてH3のサイズは2^3=8でH12のサイズは2^12で4096バイトのサイズを持ちます。例えば3byteのデータを要求されたらH3から配置し、20バイトならH4から取得します。

    Heap*[12] heaps;

ここで、H[3] 内の事を考えましょう。

H3の中には、セグメントに別れて大量の8byteの領域があります。

この１つ１つに1ビットを割り当てましょう。
1セグメントは128kなので、8で割ると、2 64k,4 32k, 8 16k個bit必要です。ということは、32bitマシンだと、これを32で割ると、512個のint配列があれば、１つのセグメントを１つのint配列で表す事が出来ます。

    101010001010101010........

さて、ビットマップの配列と、サイズを持つ事にしましょう。

    typedef struct Heap {
      Seg* S_start;
      Seg* S_end;
      int bitmap_size;
      int* bitmap;
    } Heap;

とビットマップの中には配置情報が格納されています。この1が立っている箇所は、メモリが格納されています。これをリニアに検索すると、大変です。

そこで、ポインタを持つと良いでしょう。

     v
    101010001010101010........

このポインタの位置に空のデータが入っています。配置したら、ここにビットを立てて、リニアに次の検索をすれば良い訳です。
ポインタはとりあえず、番号だけ持っておけばよいでしょう。

    typedef struct Heap {
      Seg* S_start;
      Seg* S_end;
      int bitmap_size;
      int* bitmap;
      int next;
    } Heap;

とりあえずここまで考えたもので、実装してみましょう。