package main

import (
	"fmt"
	"io/ioutil"
	"strings"
)

func main() {
	dat, _ := ioutil.ReadFile("input.txt")
	ary := strings.Split(string(dat), "\n")

	wire1 := ConvertToWireDef(ParseInputString(ary[0]))
	wire2 := ConvertToWireDef(ParseInputString(ary[1]))

	wire1_points := GetWirePoints(wire1)
	wire2_points := GetWirePoints(wire2)

	intersections := FindCommonPoints(wire1_points, wire2_points)
	closest_intersection := FindClosestPoint(intersections)

	fmt.Println(ManhattanDistance(closest_intersection))
}
