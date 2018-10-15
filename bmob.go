package main

import (
	"github.com/bmob/bmob-go-sdk"
	"log"
	"encoding/json"
	"fmt"
)

var (
	appConfig = bmob.RestConfig{"ecd7d36227676406628e78dea339fc92",
		"de5f533b4bd6ea9ba38b7d87025cc489"}
)

type TestData struct {
	Score string
	//data  DataType
}

type MyRes struct {
	bmob.RestResponse
	bmob.ImageResponse
}

type TestDataRes struct {
	TestData
	MyRes
}

func newBmob() {
	a := bmob.RestResponse{}
	log.Println(a)
	log.Println("****************************************")
	var respDst = TestDataRes{}

	header, err := bmob.DoRestReq(appConfig,
		bmob.RestRequest{
			bmob.BaseReq{
				"GET",
				bmob.ApiRestURL("GameScore") + "/",
				""},
			"application/json",
			nil},
		&respDst)
	if err == nil {
		log.Println(header)
		log.Println(respDst)
	} else {
		log.Panic(err)
	}

	log.Println("****************************************")
}

func BmobInsertPost()  {
	log.Println("****************************************")

	var testData = TestData{"100"}
	b, err := json.Marshal(testData)
	if err != nil {
		fmt.Println("error:", err)
	}
	var respDst = TestDataRes{}
	header, err := bmob.DoRestReq(appConfig,
		bmob.RestRequest{
			bmob.BaseReq{
				"POST",
				bmob.ApiRestURL("GameScore"),
				""},
			"application/json",
			b},
		&respDst)
	if err == nil {
		log.Println(header)
		log.Println(respDst)
	} else {
		log.Panic(err)
	}

	log.Println("****************************************")
}


