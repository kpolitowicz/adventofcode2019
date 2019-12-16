package main

import (
	"testing"
)

func TestCheckPasswordValid(t *testing.T) {
	password := "122345"

	if !CheckPasswordValid(password) {
		t.Errorf("Password %v should be valid!", password)
	}
}

func TestCheckPasswordInvalid(t *testing.T) {
	password := "223450"

	if CheckPasswordValid(password) {
		t.Errorf("Password %v should be invalid!", password)
	}
}
