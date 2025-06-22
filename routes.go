package main

import (
	"net/http"
)

func (app *application) routes() http.Handler {
	mux := http.NewServeMux()
	mux.Handle("/query", app.graphqlHandler())
	mux.Handle("/playground", app.graphqlPlaygroundHandler())
	return mux
}
