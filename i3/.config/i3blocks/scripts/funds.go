package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"regexp"
	"strings"
)

var FundInfoPattern = regexp.MustCompile(`jsonpgz\((.*)\)`)

type Fund struct {
	Id     string `json:"fundcode"`
	Name   string `json:"name"`
	Change string `json:"gszzl"`
}

func getInfo(findId string) *Fund {
	url := fmt.Sprintf("http://fundgz.1234567.com.cn/js/%s.js", findId)
	resp, _ := http.Get(url)
	respBody, _ := ioutil.ReadAll(resp.Body)
	respBody = FundInfoPattern.FindSubmatch(respBody)[1]
	defer resp.Body.Close()

	data := new(Fund)

	if err := json.Unmarshal(respBody, data); err != nil {
		fmt.Println(err)
	}
	return data
}

func main() {
	funds := make(chan *Fund)
	fundMaps := map[string]string{"000311": "沪深", "110003": "上证", "110022": "消费"}
	for fundId := range fundMaps {
		go func(fundId string) {
			funds <- getInfo(fundId)
		}(fundId)
	}
	var result []string
	for range fundMaps {
		fund := <-funds
		result = append(result, fmt.Sprintf("%s:%s", fundMaps[fund.Id], fund.Change))
	}
	fmt.Println(strings.Join(result, " "))
}
