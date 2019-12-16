package main

// import "fmt"
import "strconv"

func ListValidPasswordsInRange(from, to int) (res []int) {
	for number := from; number <= to; number++ {
		if CheckPasswordValid(strconv.Itoa(number)) {
			res = append(res, number)
		}
	}
	return
}

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
