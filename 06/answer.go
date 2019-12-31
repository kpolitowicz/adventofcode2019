package main

import (
	"fmt"
	"io/ioutil"
	"strings"
)

func main() {
	dat, _ := ioutil.ReadFile("input.txt")
	cleaned := strings.Trim(string(dat), "\n")

	fmt.Println(CalculateOrbits(cleaned))
	fmt.Println(TotalTransfers(cleaned, "YOU", "SAN"))
}
