refine_original <- read.csv("~/Documents/Personal Documents/Personal/R/refine_original.csv")
head(refine_original)

refine_working <- refine_original
class(refine_working)

refine_working$company[grepl("p", refine_working$company)] <- "phillips"
refine_working$company[grepl("k", refine_working$company)] <- "akzo"
refine_working$company[grepl("t", refine_working$company)] <- "van houten"
refine_working$company[grepl("r", refine_working$company)] <- "unilever"
head(refine_working)

refine_working$product_code <- substr(refine_working$Product.code...number, 1,1)
refine_working$product_number <- substr(refine_working$Product.code...number, 3,4)
head(refine_working)

refine_working$product_category <- ifelse(refine_working$product_code == "p", "Smartphone", 
                                          ifelse(refine_working$product_code == "v", "TV",
                                                 ifelse(refine_working$product_code == "x", "Laptop", "Tablet")))
head(refine_working)

refine_working$full_address <- paste(refine_working$address, refine_working$city, refine_working$country, sep = ", ")

head(refine_working)

refine_working$company_phillips <- ifelse(refine_working$company == "phillips", 1, 0)
refine_working$company_akzo <- ifelse(refine_working$company == "akzo", 1, 0)
refine_working$company_van_houten <- ifelse(refine_working$company == "van houten", 1, 0)
refine_working$company_unilever <- ifelse(refine_working$company == "unilever", 1, 0)

refine_working$product_smartphone <- ifelse(refine_working$product_category == "Smartphone", 1, 0)
refine_working$product_tv <- ifelse(refine_working$product_category == "TV", 1, 0)
refine_working$product_laptop <- ifelse(refine_working$product_category == "Laptop", 1, 0)
refine_working$product_tablet <- ifelse(refine_working$product_category == "Tablet", 1, 0)

head(refine_working)

refine_working
write.csv(refine_working, file = "refine_clean.csv")