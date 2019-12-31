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

func TestBuildTreeFromInput(t *testing.T) {
	input := [][]string{
		[]string{"COM", "B"},
		[]string{"B", "C"},
		[]string{"C", "D"},
		[]string{"B", "E"},
	}

	got := BuildTreeFromInput(input)
	want := map[string]Node{
		"COM": Node{"_root_", []string{"B"}},
		"B":   Node{"COM", []string{"C", "E"}},
		"C":   Node{"B", []string{"D"}},
		"D":   Node{"C", []string{}},
		"E":   Node{"B", []string{}},
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}
