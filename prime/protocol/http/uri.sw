#>>==>>|prime|protocol.http.uri|/prime/protocol/http/uri.sw
(package "protocol.http.uri" "protocol.uri" (lambda (NS URI)
	(. NS "GetBasePath" (lambda (uri)
			(. ((. NS "Translate") uri) (. URI Path))
			))
	(. NS "Translate" (lambda (uri)
			((. URI "Translate") uri "\/")
			))
	(. NS "Build" (lambda (r)
			((. URI "Build") r "\/")
			))
	))
