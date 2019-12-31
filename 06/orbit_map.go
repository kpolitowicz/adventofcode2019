package main

import "strings"

type Node struct {
	parent   string
	children []string
	orbits   int
}

func NewNode(parent string, children []string) Node {
	return Node{parent, children, -1}
}

func CalculateOrbits(input string) int {
	tree := BuildTreeFromInput(ConvertInputToList(input))

	return SumOrbits(AssignOrbits(tree))
}

func PathToRoot(input string, nodeName string) (res []string) {
	tree := BuildTreeFromInput(ConvertInputToList(input))

	currentName := nodeName
	currentNode := tree[nodeName]
	for currentNode.parent != "_root_" {
		res = append(res, currentName)
		currentName = currentNode.parent
		currentNode = tree[currentName]
	}

	return append(res, currentName)
}

func ConvertInputToList(input string) (res [][]string) {
	for _, line := range strings.Split(input, "\n") {
		res = append(res, strings.Split(line, ")"))
	}
	return
}

func BuildTreeFromInput(input [][]string) map[string]Node {
	tree := make(map[string]Node)

	for _, nodeSpec := range input {
		node1Name := nodeSpec[0]
		node2Name := nodeSpec[1]

		tree[node1Name] = makeParentNode(tree, node1Name, node2Name)
		tree[node2Name] = makeChildNode(tree, node1Name, node2Name)
	}

	return tree
}

func AssignOrbits(tree map[string]Node) map[string]Node {
	return assignOrbitsFor(tree, findRootNode(tree), 0)
}

func SumOrbits(tree map[string]Node) int {
	res := 0

	for _, node := range tree {
		res += node.orbits
	}

	return res
}

func findRootNode(tree map[string]Node) string {
	for name, node := range tree {
		if node.parent == "_root_" {
			return name
		}
	}

	return ""
}

func assignOrbitsFor(tree map[string]Node, currentNodeName string, currentLevel int) map[string]Node {
	node := tree[currentNodeName]
	node.orbits = currentLevel

	for _, nodeName := range node.children {
		tree = assignOrbitsFor(tree, nodeName, currentLevel+1)
	}

	tree[currentNodeName] = node

	return tree
}

func makeParentNode(tree map[string]Node, pnodeName string, cnodeName string) (res Node) {
	node, hasNode := tree[pnodeName]
	if hasNode {
		node.children = append(node.children, cnodeName)
		res = node
	} else {
		res = NewNode("_root_", []string{cnodeName})
	}

	return
}

func makeChildNode(tree map[string]Node, pnodeName string, cnodeName string) (res Node) {
	node, hasNode := tree[cnodeName]
	if hasNode {
		node.parent = pnodeName
		res = node
	} else {
		res = NewNode(pnodeName, []string{})
	}

	return
}
