package main

import (
	"testing"
)

func TestCheckPasswordValid(t *testing.T) {
	passwords := []string{
		"122345",
	}

	for _, password := range passwords {
		if !CheckPasswordValid(password) {
			t.Errorf("Password %v should be valid!", password)
		}
	}
}

func TestCheckPasswordInvalid(t *testing.T) {
	passwords := []string{
		"223450",
	}

	for _, password := range passwords {
		if CheckPasswordValid(password) {
			t.Errorf("Password %v should be invalid!", password)
		}
	}
}
