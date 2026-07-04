import Vapor

@main
struct Run {
    static func main() throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)
        let app = Application(env)
        defer { app.shutdown() }
        try configure(app)
        try app.run()
    }
}

func configure(_ app: Application) throws {
    app.routes.get("hello") { req -> Response in
        let json = ["message": "Namaste from Swift + Vapor!"]
        return try Response(status: .ok, headers: ["Content-Type":"application/json"], body: .init(data: JSONEncoder().encode(json)))
    }
}
