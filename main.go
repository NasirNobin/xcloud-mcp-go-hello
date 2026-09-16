package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Hello from Go on xCloud\n")
	})

	addr := ":" + port
	log.Printf("go-hello listening on %s", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
