APPT_DIR = /usr/local/bin

install: 
	mkdir -p $(APPT_DIR)

	sudo cp ./appt.sh $(APPT_DIR)
	sudo mv $(APPT_DIR)/appt.sh $(APPT_DIR)/appt
	sudo cp ./templates -r $(APPT_DIR)/app_templates

	sudo chmod +x $(APPT_DIR)/appt

uninstall:
	sudo rm -rf $(APPT_DIR)/appt
	sudo rm -rf $(APPT_DIR)/app_templates
