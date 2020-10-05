package main

import (
	"os"
	/*
		"github.com/getcouragenow/sdk/cmd/yurt-run"
		"github.com/getcouragenow/sdk/cmd/yurt-cluster"
	*/
	yurt "github.com/getcouragenow/sdk/cmd/yurt-run"
)

func main() {
	resp := yurt.Execute(os.Args[1:])

	if resp.Err != nil {
		if resp.IsUserError() {
			resp.Cmd.Println("")
			resp.Cmd.Println(resp.Cmd.UsageString())
		}
		os.Exit(-1)
	}

}
