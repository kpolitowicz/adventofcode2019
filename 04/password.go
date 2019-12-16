package main

// import "fmt"

func CheckPasswordValid(password string) bool {
	if len(password) != 6 {
		return false
	}

	doubleFound := false
	lastChar := byte('0')

	for _, char := range password {
		if byte(char) < lastChar {
			return false
		}
		if byte(char) == lastChar {
			doubleFound = true
		}
		lastChar = byte(char)
	}

	return doubleFound
}
