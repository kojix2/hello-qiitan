module Hello
  # shard.yml からバージョンを拾ってくれる
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end
