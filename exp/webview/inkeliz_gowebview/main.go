package main

import "github.com/inkeliz/gowebview"

func main() {
	w, err := gowebview.New(&gowebview.Config{Title: "Hello World", Size: gowebview.Point{X: 800, Y: 800}})
	if err != nil {
		panic(err)
	}
	defer w.Destroy()
	w.SetURL(`https://google.com`)
	w.Run()
}
