package s3ops

import (
	"log"
	"os"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
)

var currentSession *session.Session

func init() {
	GetSession()
}

func GetSession() *session.Session {
	if currentSession == nil {
		var err error
		currentSession, err = session.NewSession(&aws.Config{
			Region: aws.String(os.Getenv("REGION")),
		},
		)
		log.Println(currentSession)
		if err != nil {
			log.Panicln(err)
		}
	}
	return currentSession
}
