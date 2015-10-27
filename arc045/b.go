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
	for i := 0; i < len(rooms); i++ {
		count += rooms[i]
		rooms[i] = count
	}

	flags := make([]bool, m)
	for i := 0; i < len(flags); i++ {
		flags[i] = true
	}
	for i := 0; i < m; i++ {
		for j := section[i][0]; j <= section[i][1]; j++ {
			if rooms[j] <= 1 {
				flags[i] = false
			}
		}
	}

	ans_count := 0
	for i := 0; i < len(flags); i++ {
		if flags[i] {
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
