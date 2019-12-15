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

func TestGetWirePoints(t *testing.T) {
	got := GetWirePoints([]wireDef{wireDef{'R', 3}, wireDef{'U', 2}, wireDef{'L', 2}, wireDef{'D', 1}})
	want := []point{
		point{1, 0},
		point{2, 0},
		point{3, 0},
		point{3, 1},
		point{3, 2},
		point{2, 2},
		point{1, 2},
		point{1, 1},
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

func TestFindCommonPoints(t *testing.T) {
	wire1 := GetWirePoints([]wireDef{
		wireDef{'R', 8},
		wireDef{'U', 5},
		wireDef{'L', 5},
		wireDef{'D', 3},
	})
	wire2 := GetWirePoints([]wireDef{
		wireDef{'U', 7},
		wireDef{'R', 6},
		wireDef{'D', 4},
		wireDef{'L', 4},
	})
	got := FindCommonPoints(wire1, wire2)
	want := []point{
		point{6, 5},
		point{3, 3},
	}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}

func TestManhattanDistance(t *testing.T) {
	got := ManhattanDistance(point{6, 5})
	want := 11
	if !reflect.DeepEqual(got, want) {
		t.Errorf("got %v want %v", got, want)
	}
}
