require "gettext"
require "./hello/parser"
require "./hello/greeter"

# Gettextの初期化
Gettext.setlocale(Gettext::LC::ALL, "")
Gettext.bindtextdomain("com.qiita.kojix2.hello-qiitan", {{env("HELLO_QIITAN_LOCALE_LOCATION") || "/usr/share/locale"}})
Gettext.textdomain("com.qiita.kojix2.hello-qiitan")

# コマンドラインパーサーを作成し、コマンドラインオプションをパースする
options = Hello::Parser.new.parse

# 処理をするクラスのインスタンスを生成する
greeter = Hello::Greeter.new

# オプションに基づき処理をさせる
greeter.greet(options.name, options.period)
