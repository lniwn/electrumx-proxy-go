package config

import (
	"github.com/BurntSushi/toml"
	"log"
	"os"
	"path"
)

type Config struct {
	ElectrumxServer string
	ServerAddress   string
}

var Conf Config

func InitConf() {
	if _, err := toml.DecodeFile(path.Join(os.Getenv("CONFIG_FILE_PATH"), "config.toml"), &Conf); err != nil {
		log.Fatal(err)
	}
}
