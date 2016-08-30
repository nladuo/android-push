package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"strings"
)

func sendBroadCast(data string) {

	url := "http://127.0.0.1:7172/1/push/all"
	req, err := http.NewRequest("POST", url, strings.NewReader(data))
	if err != nil {
		return
	}

	req.Header.Set("Content-Type", "application/x-www-form-urlencoded")

	client := http.Client{}
	client.Do(req)
}

func main() {
	router := gin.Default()

	router.Static("/css", "./www/css")
	router.Static("/js", "./www/js")
	router.StaticFile("/", "./www")
	router.POST("/api/broadcast", handleBroadCast)
	router.Run(":2333")

}

func handleBroadCast(c *gin.Context) {
	content := c.DefaultPostForm("content", "")
	if len(content) == 0 {
		c.JSON(http.StatusOK, gin.H{
			"code": 1,
			"msg":  "empty content!",
		})
	} else {
		sendBroadCast(content)
		c.JSON(http.StatusOK, gin.H{
			"code": 0,
			"msg":  "broadcast success!",
			"data": content,
		})
	}

}
