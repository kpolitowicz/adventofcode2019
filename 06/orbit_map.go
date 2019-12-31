package main

// import "fmt"
import "strings"

type Node struct {
	parent   string
	children []string
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

func makeParentNode(tree map[string]Node, pnodeName string, cnodeName string) (res Node) {
	node, hasNode := tree[pnodeName]
	if hasNode {
		node.children = append(node.children, cnodeName)
		res = node
	} else {
		res = Node{"_root_", []string{cnodeName}}
	}

	return
}

func makeChildNode(tree map[string]Node, pnodeName string, cnodeName string) (res Node) {
	node, hasNode := tree[cnodeName]
	if hasNode {
		node.parent = pnodeName
		res = node
	} else {
		res = Node{pnodeName, []string{}}
	}

	return
}
