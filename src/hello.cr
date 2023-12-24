require "./hello/parser"
require "./hello/greeter"

# コマンドラインパーサーを作成し、コマンドラインオプションをパースする
options = Hello::Parser.new.parse

# 処理をするクラスのインスタンスを生成する
greeter = Hello::Greeter.new

# オプションに基づき処理をさせる
greeter.greet(options.name, options.period)
