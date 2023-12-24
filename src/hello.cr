require "gettext"
require "./hello/parser"
require "./hello/greeter"

# Gettextの初期化
Gettext.setlocale(Gettext::LC::ALL, "")
Gettext.bindtextdomain("qiitan", "/home/kojix2/Crystal/hello-qiitan")
Gettext.textdomain("qiitan")

# コマンドラインパーサーを作成し、コマンドラインオプションをパースする
options = Hello::Parser.new.parse

# 処理をするクラスのインスタンスを生成する
greeter = Hello::Greeter.new

# オプションに基づき処理をさせる
greeter.greet(options.name, options.period)
