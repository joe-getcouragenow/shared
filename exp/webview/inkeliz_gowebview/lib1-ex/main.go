package main

import "github.com/webview/webview"

func main() {
	debug := true
	w := webview.New(debug)
	defer w.Destroy()
	w.SetTitle("Minimal webview example")
	w.SetSize(800, 600, webview.HintNone)
	//w.Navigate("https://en.m.wikipedia.org/wiki/Main_Page")

	// a gmeet fails a check done by them saying "gmeet does not work in your browser. Download ... standad browsers"
	w.Navigate("https://meet.google.com/ovn-gtyb-kbe")

	w.Run()
}
