# jasc

jasmin fast assembler


jasc はocamlで作成中のwindowsでもビルドが楽に出来る、jasmin形式のjvmバイトコードアセンブラです。
aa.j ファイルをコンパイルしてaa.classファイルを作成出来ます。

元ファイルをHaxeのjavalibから派生して、とにかく他のライブラリへの依存を減らしてます。

今はそこそこ動きます。

## LICENSE

LGPL

## TODO

- [x] a.javaを動かす
	- [x] constの中味が表示されない
	- [x] コンパイル結果が固定になってる

- [x] jasmcのテストを持って来て潰す。
	- [x] コンスタントな値
	- [x] インターフェイス
	- [x] long

- [x] 奇麗にする
- [ ] テストのチェックをjavaコマンド実行結果で比較して行う
- [ ] インナークラス対応
- [ ] アノテーションのテスト