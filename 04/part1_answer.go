package main

import (
	"fmt"
)

func main() {
	allValidPasswords := ListValidPasswordsInRange(245182, 790572)
	fmt.Println(len(allValidPasswords))
}
