default: CSVData.csv
%.csv: %.csv.rules
	hledger import $@

%.csv.rules: %.csv.rules.h
	cat $< > $@
	mlr --c2p --ojson uniq -f cate CSVData.csv | jq -rf $@.jq >> $@

clean:
	rm -rf .latest.CSVData.csv ~/.hledger.journal

