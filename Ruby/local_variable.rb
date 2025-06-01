foo = 1

def bar
  # メソッドから外側のローカル変数は参照できないため、メソッド呼び出しとみなされる
  foo
end

# barメソッド内の変数fooはメソッド外で宣言されているため、参照できずに例外が発生
p bar # => `bar': undefined local variable or method `foo' for main (NameError)
