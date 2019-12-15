package main

import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

type wireDef struct {
	direction byte
	steps     int
}

type point struct {
	x, y int
}

func ParseInputString(inputStr string) []string {
	return strings.Split(inputStr, ",")
}

func ConvertToWireDef(wireDirectives []string) (res []wireDef) {
	for _, wireDir := range wireDirectives {
		res = append(res, parseWireDirectiveIntoDef(wireDir))
	}
	return
}

func GetWirePoints(wireDefs []wireDef) (res []point) {
	currentPos := point{0, 0}
	for _, wireDef := range wireDefs {
		res = append(res, pointsFrom(wireDef, currentPos)...)
		currentPos = res[len(res)-1]
	}
	return
}

// TODO: implement wire args as set with intersection
func FindCommonPoints(wire1, wire2 []point) (res []point) {
	for _, wire1_point := range wire1 {
		for _, wire2_point := range wire2 {
			if wire1_point == wire2_point {
				res = append(res, wire1_point)
			}
		}
	}
	return
}

func FindClosestPoint(points []point) (res point) {
	shortestDist := 1_000_000_000
	for _, p := range points {
		dist := ManhattanDistance(p)
		if dist < shortestDist {
			shortestDist = dist
			res = p
		}
	}
	return
}

func ManhattanDistance(p point) int {
	return int(math.Abs(float64(p.x))) + int(math.Abs(float64(p.y)))
}

func parseWireDirectiveIntoDef(wireDir string) wireDef {
	dir := wireDir[0]
	steps, _ := strconv.Atoi(string(wireDir[1]))
	return wireDef{dir, steps}
}

func pointsFrom(wireD wireDef, startPos point) (res []point) {
	switch wireD.direction {
	case 'R':
		res = append(res, moveRight(wireD.steps, startPos)...)
	case 'L':
		res = append(res, moveLeft(wireD.steps, startPos)...)
	case 'U':
		res = append(res, moveUp(wireD.steps, startPos)...)
	case 'D':
		res = append(res, moveDown(wireD.steps, startPos)...)
	}
	return
}

func moveRight(steps int, startPos point) (res []point) {
	for i := 1; i <= steps; i++ {
		res = append(res, point{startPos.x + i, startPos.y})
	}
	return
}

func moveLeft(steps int, startPos point) (res []point) {
	for i := 1; i <= steps; i++ {
		res = append(res, point{startPos.x - i, startPos.y})
	}
	return
}

func moveUp(steps int, startPos point) (res []point) {
	for i := 1; i <= steps; i++ {
		res = append(res, point{startPos.x, startPos.y + i})
	}
	return
}

func moveDown(steps int, startPos point) (res []point) {
	for i := 1; i <= steps; i++ {
		res = append(res, point{startPos.x, startPos.y - i})
	}
	return
}

func main() {
	fmt.Println("Hello,", strings.Split("R8,U5", ""))
}
