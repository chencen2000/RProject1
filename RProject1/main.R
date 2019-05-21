report_func <- function(report.fn) {
    library(jsonlite)
    if (file.exists(report.fn)) {
        data <- fromJSON(report.fn)
        #print(data)
        data1 <- subset.data.frame(data, !is.na(data$imei), select = c('imei', 'XPO', "VZW", "OE", "FD"))
        total <- nrow(subset.data.frame(data, !is.na(data$imei)))
        print(sprintf("VZW vs XPO: %.1f %%", 100 * nrow(subset.data.frame(data, data$XPO == data$VZW)) / total))
        print(sprintf("FD vs VZW: %.1f %%", 100 * nrow(subset.data.frame(data, data$FD == data$VZW)) / total))
        print(sprintf("FD vs XPO: %.1f %%", 100 * nrow(subset.data.frame(data, data$FD == data$XPO)) / total))
        print(sprintf("FD vs VZW|XPO: %.1f %%", 100 * nrow(subset.data.frame(data, (data$FD == data$VZW | data$FD == data$XPO))) / total))
        print(sprintf("OE vs VZW: %.1f %%", 100 * nrow(subset.data.frame(data, data$OE == data$VZW)) / total))
        print(sprintf("OE vs XPO: %.1f %%", 100 * nrow(subset.data.frame(data, data$OE == data$XPO)) / total))
    }
    else {
        print("missing report file.")
    }
}

report_func_csv <- function(report.fn) {
    if (file.exists(report.fn)) {
        data <- read.csv(report.fn, comment.char = "#", stringsAsFactors = FALSE)
        #print(data)
        #data1 <- subset.data.frame(data, !is.na(data$imei), select = c('imei', 'XPO', "VZW", "OE", "FD"))
        total <- nrow(subset.data.frame(data, !is.na(data$imei)))
        print(sprintf("Total records: %s", total))
        print(sprintf("VZW vs XPO: %.1f %%", 100 * nrow(subset.data.frame(data, data$XPO == data$VZW)) / total))
        print(sprintf("FD vs VZW: %.1f %%", 100 * nrow(subset.data.frame(data, data$FD == data$VZW)) / total))
        print(sprintf("FD vs XPO: %.1f %%", 100 * nrow(subset.data.frame(data, data$FD == data$XPO)) / total))
        print(sprintf("FD vs VZW|XPO: %.1f %%", 100 * nrow(subset.data.frame(data, (data$FD == data$VZW | data$FD == data$XPO))) / total))
        print(sprintf("OE vs VZW: %.1f %%", 100 * nrow(subset.data.frame(data, data$OE == data$VZW)) / total))
        print(sprintf("OE vs XPO: %.1f %%", 100 * nrow(subset.data.frame(data, data$OE == data$XPO)) / total))
    }
    else {
        print("missing report file.")
    }
}

#fn='C:/projects/local/GradeChecker/GradeChecker/bin/Debug/report.json'
#report_func(fn)
fn = 'C:/Users/qa/source/repos/chencen2000/GradeChecker/GradeChecker/bin/Debug/test.csv'
report_func_csv(fn)
