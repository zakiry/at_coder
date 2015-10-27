package main

import "fmt"

func main() {
	var n, m int
	section := make([][2]int, 0, m)
	fmt.Scanf("%d %d", &n, &m)

	rooms := make([]int, n+2)
	for i := 0; i < m; i++ {
		var s, t int
		fmt.Scanf("%d %d", &s, &t)
		section = append(section, [2]int{s, t})
		rooms[s]++
		rooms[t+1]--
	}

	count := 0
	for i := 1; i < len(rooms); i++ {
		count += rooms[i]
		if count <= 1 {
			rooms[i] = rooms[i-1] + 1
		} else {
			rooms[i] = rooms[i-1]
		}
	}

	ans_count := 0
	flags := make([]bool, m)
	for i := 0; i < m; i++ {
		if rooms[section[i][1]]-rooms[section[i][0]-1] == 0 {
			flags[i] = true
			ans_count++
		}
	}

	fmt.Println(ans_count)
	for i := 0; i < len(flags); i++ {
		if flags[i] {
			fmt.Println(i + 1)
		}
	}
}
