#>>==>>|nodejs|weblet.response.errorstatus|/nodejs/weblet/response/errorstatus.sw
(package "weblet.response.errorstatus" "protocol.http.status" (lambda (NS HTTPStatus)
	(. NS "Send" (lambda (response statusCode)
			(. response "statusCode" statusCode)
			((. response "write") (+ "<html><body><h2>" statusCode " " ((. HTTPStatus "GetDescription") statusCode) "<\/h2><\/body><\/html>"))
			((. response "end"))
			))
	))
