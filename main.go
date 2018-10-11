package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", home)
	http.ListenAndServe(":80", nil)
}

func home(w http.ResponseWriter, r *http.Request) {
	fmt.Println("welcome to ks travel")
	fmt.Fprintf(w, "welcome to ks travel")
}
