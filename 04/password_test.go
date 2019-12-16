package main

import (
	"reflect"
	"testing"
)

func TestListValidPasswordsInRange(t *testing.T) {
	got := ListValidPasswordsInRange(111119, 111133)
	want := []int{
		111122,
		111133,
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

func TestCheckPasswordValid(t *testing.T) {
	passwords := []string{
		"122345",
		"112233",
		"111122",
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
		"135679",
		"123789",
		"111",
		"1111111",
		"111123",
		"111111",
		"123444",
	}

	for _, password := range passwords {
		if CheckPasswordValid(password) {
			t.Errorf("Password %v should be invalid!", password)
		}
	}
}
