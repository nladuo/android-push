package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func sendBroadCast() {

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
		c.JSON(http.StatusOK, gin.H{
			"code": 0,
			"msg":  "broadcast success!",
			"data": content,
		})
	}

}
