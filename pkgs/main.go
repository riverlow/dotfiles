package main

import (
	"fmt"

	_ "bitbucket.org/bertimus9/systemstat"
	_ "fyne.io/fyne/v2"
	_ "github.com/aerogo/packet"
	_ "github.com/armon/go-socks5"
	_ "github.com/bmizerany/pat"
	_ "github.com/dghubble/go-twitter/twitter"
	_ "github.com/dghubble/oauth1"
	_ "github.com/free/sql_exporter"
	_ "github.com/go-sql-driver/mysql"
	_ "github.com/go-telegram-bot-api/telegram-bot-api"
	_ "github.com/golang/protobuf/proto"
	_ "github.com/golangcollege/sessions"
	_ "github.com/google/goexpect"
	_ "github.com/google/gopacket"
	_ "github.com/gorilla/mux"
	_ "github.com/gorilla/sessions"
	_ "github.com/gorilla/websocket"
	_ "github.com/jlaffaye/ftp"
	_ "github.com/jmoiron/sqlx"
	_ "github.com/justinas/alice"
	_ "github.com/justinas/nosurf"
	_ "github.com/mattn/go-shellwords"
	_ "github.com/mattn/go-sqlite3"
	_ "github.com/microcosm-cc/bluemonday"
	_ "github.com/spf13/cobra"
	_ "github.com/spf13/pflag"
	_ "github.com/spf13/viper"
	_ "github.com/stretchr/testify/assert"
	_ "github.com/ziutek/telnet"
	_ "go.uber.org/zap"
	_ "golang.org/x/oauth2"
	_ "google.golang.org/grpc"
	_ "gopkg.in/russross/blackfriday.v2"
	_ "gopkg.in/tucnak/telebot.v2"
)

func main() {
	fmt.Println("vim-go")
}
