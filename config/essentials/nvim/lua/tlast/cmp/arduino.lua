require'lspconfig'.arduino_language_server.setup{
	cmd = {"arduino-language-server", "-cli-config", "~/.arduinoIDE/arduino-cli.yaml"}
}
