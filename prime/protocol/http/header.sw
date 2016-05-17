#>>==>>|prime|protocol.http.header|/prime/protocol/http/header.sw
(package "protocol.http.header" "script.string" (lambda (NS SString)
	ParseKeyValuePair:(. NS "ParseKeyValuePair" (lambda (headerLine)
			idx:((. headerLine "indexOf") ":")
			(if (== idx -1)
				headerLine
				(do key:((. SString "Trim") ((. headerLine "substring") 0 idx))
					value:((. SString "Trim") ((. headerLine "substr") (+ idx 1)))
					[key value]
					)
				)
			))
	(. NS "Parse" (lambda (readLine callback)
			line:undefined
			(while (!= line=(readLine) null)
				kv:(ParseKeyValuePair line)
				(if (=== kv line)
					(callback kv)
					(callback (. kv 0) (. kv 1))
					)
				)
			))
	))
