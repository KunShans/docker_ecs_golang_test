package main

import (
	"fmt"
	"github.com/labstack/gommon/log"
	"github.com/kataras/iris"
	"github.com/kataras/iris/context"
)

func main() {
	fmt.Println("Hello ks docker")
	//http.HandleFunc("/ping", home)
	//http.ListenAndServe(":80", nil)

	app := iris.New()

	app.Get("/ping", func(ctx context.Context) {
		log.Infof("ping")
		ctx.WriteString("pong pong")
	})
	app.Run(iris.Addr(":8080"), iris.WithCharset("UTF-8"))

	fmt.Println("Hello ks docker 2")

}

//func home(w http.ResponseWriter, r *http.Request) {
//	fmt.Println("welcome to ks travel")
//	fmt.Fprintf(w, "welcome to ks travel")
//}
