package main

import (
	"reflect"
	"testing"
)

func TestParseInputString(t *testing.T) {
	got := ParseInputString("R8,U5,L5,D3")
	want := []string{"R8", "U5", "L5", "D3"}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

func TestConvertToWireDef(t *testing.T) {
	got := ConvertToWireDef([]string{"R8", "U5"})
	want := []wireDef{wireDef{'R', 8}, wireDef{'U', 5}}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}
