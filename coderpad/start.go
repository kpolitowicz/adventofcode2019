// To execute Go code, please declare a func main() in a package "main"

package main

import (
	"fmt"
	"testing"
)

func Calculate(num int) int {
	return num/3 - 2
}

func TestCalculate(t *testing.T) {
	got := Calculate(14)
	want := 2

	if got != want {
		t.Errorf("got %v want %v", got, want)
	}
}

func main() {
	fmt.Println("Success!")
}
