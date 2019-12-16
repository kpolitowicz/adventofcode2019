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
	matchingDigits := 1
	lastChar := byte('0')

	for _, char := range password {
		if byte(char) < lastChar {
			return false
		}
		if byte(char) == lastChar {
			matchingDigits++
		}
		if byte(char) > lastChar {
			if matchingDigits == 2 {
				doubleFound = true
			}
			matchingDigits = 1
		}
		lastChar = byte(char)
	}

	return doubleFound || matchingDigits == 2
}
