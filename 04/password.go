package main

// import "fmt"

func CheckPasswordValid(password string) bool {
	lastChar := byte('0')

	for _, char := range password {
		if byte(char) < lastChar {
			return false
		}
		lastChar = byte(char)
	}

	return true
}
