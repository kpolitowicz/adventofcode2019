package main

import (
	// "fmt"
	"reflect"
	"testing"
)

func TestConvertInputToList(t *testing.T) {
	input := `COM)B
B)C
C)D
B)E`

	got := ConvertInputToList(input)
	want := [][]string{
		[]string{"COM", "B"},
		[]string{"B", "C"},
		[]string{"C", "D"},
		[]string{"B", "E"},
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

// func TestBuildTreeFromInput(t *testing.T) {
// 	input := `COM)B
// B)C
// C)D
// B)E`

// 	tree := BuildTreeFromInput(input)

// 	if len(tree) != 4 {
// 		t.Errorf("got %v want %v", len(tree), 4)
// 	}
// }
