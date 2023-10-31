default: CSVData.csv
%.csv: %.csv.rules
	hledger import $@

%.csv.rules: %.csv.rules.h
	cat $< > $@
	mlr --c2p --ojson uniq -f cate CSVData.csv | jq -rf $@.jq >> $@

clean:
	rm -rf .latest.CSVData.csv ~/.hledger.journal



FILES = $$HOME/Desktop
FILES += $$HOME/Library/Containers/com.apple.Stickies/Data/Library/Stickies/
FILES += $$HOME/Library/Application\ Support/Firefox/Profiles/ci9uueui.default-release/
FILES += $$HOME/.gnupg
FILES += $$HOME/.ssh

EXCLUDING = $$HOME/Desktop/.git
RESTIC_FROM_REPO = rest:http://172.20.10.1:8000
RESTIC_REPO = ~/Documents/icebox

backup:
	restic -p .restic -r $(RESTIC_FROM_REPO) backup $(FILES)
	restic -p .restic -r $(RESTIC_FROM_REPO) check
	restic -p .restic -r $(RESTIC_REPO) --from-repo $(RESTIC_FROM_REPO) copy
	restic -p .restic -r $(RESTIC_REPO) check