package main

import (
	"reflect"
	"testing"
)

func TestCalculateOrbits(t *testing.T) {
	input := `COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L`

	got := CalculateOrbits(input)
	want := 42

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

func TestTotalTransfers(t *testing.T) {
	input := `COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
K)YOU
I)SAN`

	got := TotalTransfers(input, "YOU", "SAN")
	want := 4

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

func TestPathToRoot(t *testing.T) {
	input := `COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
K)YOU
I)SAN`

	got := PathToRoot(input, "SAN")
	want := []string{
		"SAN",
		"I",
		"D",
		"C",
		"B",
		"COM",
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

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
		"COM": Node{"_root_", []string{"B"}, -1},
		"B":   Node{"COM", []string{"C", "E"}, -1},
		"C":   Node{"B", []string{"D"}, -1},
		"D":   Node{"C", []string{}, -1},
		"E":   Node{"B", []string{}, -1},
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

func TestAssignOrbits(t *testing.T) {
	input := map[string]Node{
		"COM": Node{"_root_", []string{"B"}, -1},
		"B":   Node{"COM", []string{"C", "E"}, -1},
		"C":   Node{"B", []string{"D"}, -1},
		"D":   Node{"C", []string{}, -1},
		"E":   Node{"B", []string{}, -1},
	}

	got := AssignOrbits(input)
	want := map[string]Node{
		"COM": Node{"_root_", []string{"B"}, 0},
		"B":   Node{"COM", []string{"C", "E"}, 1},
		"C":   Node{"B", []string{"D"}, 2},
		"D":   Node{"C", []string{}, 3},
		"E":   Node{"B", []string{}, 2},
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

func TestSumOrbits(t *testing.T) {
	input := map[string]Node{
		"COM": Node{"_root_", []string{"B"}, 0},
		"B":   Node{"COM", []string{"C", "E"}, 1},
		"C":   Node{"B", []string{"D"}, 2},
		"D":   Node{"C", []string{}, 3},
		"E":   Node{"B", []string{}, 2},
	}

	got := SumOrbits(input)
	want := 8

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}
