class QueryMiddleware: Middleware {

    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        var request = request

        if let queryString = request.uri.query {
            request.query = StructuredData(formURLEncoded: queryString.data)
        }

        return try next.respond(to: request)
    }

}
