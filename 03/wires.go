package main

import (
	"fmt"
	"strconv"
	"strings"
)

type wireDef struct {
	direction byte
	steps     int
}

func ParseInputString(inputStr string) []string {
	return strings.Split(inputStr, ",")
}

func ConvertToWireDef(wireDirectives []string) (res []wireDef) {
	for _, wireDir := range wireDirectives {
		res = append(res, parseWireDirectiveIntoDef(wireDir))
	}
	return
}

func parseWireDirectiveIntoDef(wireDir string) wireDef {
	dir := wireDir[0]
	steps, _ := strconv.Atoi(string(wireDir[1]))
	return wireDef{dir, steps}
}

func main() {
	fmt.Println("Hello,", strings.Split("R8,U5", ""))
}
