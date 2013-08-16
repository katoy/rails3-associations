# 入力文字列数を表示する。
# id                 入力フォーム (text, textarea) の id
# maxLen             最大文字列数
# couter_selecto     カウンタを表示する selector. default = id + " ~ .help-block:nth-of-type(1)  (simple_form の help 領域)
# preffix            カウンタ数の前に付加する文字列.  defaule = ""
# postfix            カウンタ数の後に付加する文字列.  default = " / maxLen chars"
@counter_bind = (id, maxLen, counter_selector = id + " ~ .help-block:nth-of-type(1)", prefix = "", postfix = " / #{maxLen} chars") ->

  if $(id) and $(id).val() != `undefined`
    $(counter_selector).html "#{prefix}#{$(id).val().length}#{postfix}"

  $(id).bind "keydown keyup keypress change", ->
    $(counter_selector).html "#{prefix}#{$(this).val().length}#{postfix}"
 