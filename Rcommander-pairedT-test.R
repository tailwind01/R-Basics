
pairedData <- readXL("C:/Users/sai/Documents/RWD/paired-data.xlsx", 
  rownames=FALSE, header=TRUE, na="", sheet="Sheet1", stringsAsFactors=TRUE)

t.test(pairedData$After,pairedData$Before,paired=TRUE)
with(pairedData, (t.test(Before, After, alternative='two.sided', 
  conf.level=.95, paired=TRUE)))

