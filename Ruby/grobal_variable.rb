$foo = 1

def bar
  # グローバル変数はブロック外からでも参照可能
  # $foo を参照
  $foo
end

p bar # => 1
