#>>==>>|prime|script.string|/prime/script/string.sw
(package "script.string" (lambda (NS)
	regTrim:`/^(\s|\u00A0)+|(\s|\u00A0)+$/g
	regJs:`/(?:<script.*?>)(?:\n|\r|.)*?(?:<\/script>)/img
	regJsCode:`/(?:<script.*?>)((?:\n|\r|.)*?)(?:<\/script>)/img
	regJsCodeC1:`/<\/?script.*?>/gi
	(. NS "Trim" (lambda (text)
			((. (|| text "") "replace") regTrim "")
			))
	(. NS "GetHTMLText" (lambda (text)
			((. text "replace") regJs "")
			))
	(. NS "GetScriptText" (lambda (text)
			all:((. text "match") regJsCode)
			t:""
			i:0
			allLen:(. all "length")
			(if all
				(while (< i allLen)
					t=(+ t ((. (. all i) "replace") regJsCodeC1 "") "\n")
					i=(+ i 1)
					)
				)
			t
			))
	(. NS "StartsWith" (lambda (str ch)
			(== ((. str "indexOf") ch) 0)
			))
	(. NS "EndsWith" (lambda (str ch)
			(== ((. str "lastIndexOf") ch) (- (. str "length") (. ch "length")))
			))
	))
