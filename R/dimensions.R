#' dimensions
#'
#' initiate dimension data and create .rda files.
#'
#'
#' Exported dimension data.frames include: \cr
#' dim_entities - entity symbol, name, location, region \cr
#' dim_segments - segment symbol, commodity, group \cr
#' dim_accounts - account symbol, name, group1, group2 \cr
#'
#' @keywords dimension
#' @export
dimensions <- c("dim_entities", "dim_segments", "dim_accounts")

# inititate segment dimension
m <- rbind(
  c("GOSOYBEAN", "Soybean", "All Soybeans"),
  c("GOCOTTON", "Cottonseed", "All Cottonseeds"),
  c("GOSACOTTON", "SA Cottonseed", "All Cottonseeds"),
  c("GOFLAX", "Flaxseed", "All Flaxseeds"),
  c("GOCANOLA", "Canola", "All Rapeseeds"),
  c("GOHIOCAN", "Hi Oleic Canola", "All Rapeseeds"),
  c("GORAPESEED", "Rapeseed", "All Rapeseeds"),
  c("GONUSUN", "Nusun", "All Sunflower Seeds"),
  c("GOHOSUN", "Hi Oleic Sunseed", "All Sunflower Seeds"),
  c("GOSUNSEED", "Sunflower seed", "All Sunflower Seeds"),
  c("GOCORN", "Corn", "All Corn Processing"),
  c("GOPALM", "Palm Oils", "All Tropical Oils"),
  c("GOPKO", "Palm Kernel Oils", "All Tropical Oils"),
  c("GOCOCONUT", "Coconut Oils", "All Tropical Oils"),
  c("GOWHEAT", "CBOT Wheat", "All Wheats"),
  c("GOMILWHT", "MATIF Wheat", "All Wheats"),
  c("GOLIFWHT", "LIFFE Wheat", "All Wheats"),
  c("GOGASOIL", "Gas oil", "All Gas oils"),
  c("GOPEANUT", "Peanut", "All Peanuts"),
  c("GOOTHRSGMT", "Other segments", "All Other segments")
)
colnames(m) <- c("Segments", "Commodity", "Group")

#' @export
dim_segments <- as.data.frame(m)

# create a rda copy of the dimemsion table
devtools::use_data(dim_segments, overwrite = TRUE)

# inititate entitity dimension
m <- rbind(
  c("L10156X", "Cedar Rapids Trading", "Total Cedar Rapids", "N. America"),
  c("L10C6ZC", "Cedar Rapids Trading", "Total Cedar Rapids", "N. America"),
  c("L10164C", "Decatur East Processing", "Total Decatur", "N. America"),
  c("L10167C", "Decatur West Processing", "Total Decatur", "N. America"),
  c("L10193C", "Quincy Processing", "Total Quincy", "N. America"),
  c("L10193X", "Quincy Trading", "Total Quincy", "N. America"),
  c("L10206C", "Fremont Processing", "Total Fremont", "N. America"),
  c("L10207C", "Galesburg Processing", "Total Seed Trading", "N. America"),
  c("L10250C", "Kershaw Processing", "Total Kershaw", "N. America"),
  c("L10250X", "Monroe Trading", "Total Kershaw", "N. America"),
  c("L10268C", "Lincoln Processing", "Total Lincoln", "N. America"),
  c("L10284C", "Mankato Processing", "Total Mankato", "N. America"),
  c("L10284X", "Mankato Trading", "Total Mankato", "N. America"),
  c("L10293C", "Memphis Processing", "Total Memphis", "N. America"),
  c("L10348C", "Lubbock Processing", "Total Lubbock", "N. America"),
  c("L10348X", "Lubbock Trading", "Total Meal Trading", "N. America"),
  c("L10409C", "Red Wing Processing", "Total Red Wing", "N. America"),
  c("L10443C", "Richmond Processing", "Total Richmond", "N. America"),
  c("L10526C", "Valdosta Processing", "Total Valdosta", "N. America"),
  c("L10551C", "Valdosta Processing", "Total Valdosta", "N. America"),
  c("L10752C", "Velva Processing", "Total Velva", "N. America"),
  c("L10F04C", "Des Moines Processing", "Total Des Moines", "N. America"),
  c("L10F06C", "Fostoria Processing", "Total Fostoria", "N. America"),
  c("L10F08C", "Frankfort Processing", "Total Frankfort", "N. America"),
  c("L10F10C", "Mexico Processing", "Total Mexico", "N. America"),
  c("L10K80C", "Enderlin Processing", "Total Enderlin", "N. America"),
  c("L10K81C", "Goodland Processing", "Total Goodland", "N. America"),
  c("L10M34X", "Mt Zuma Trading - M34", "Total Meal Trading", "N. America"),
  c("L10OTHR", "Not Mapped", "Total Others", "N. America"),
  c("L10Q90C", "Export Trading - Q90", "Total Meal Export - Q90", "N. America"),
  c("L10Q90X", "Export Trading - Q90", "Total Meal Export - Q90", "N. America"),
  c("L10QW3X", "Crude Oil Export - QW3", "Total Oil Export - QW3", "N. America"),
  c("L10RM2C", "Estill Trading", "Total Seed Trading", "N. America"),
  c("L10SL8C", "Deerfield Processing", "Total Deerfield", "N. America"),
  c("L10WU3C", "Selma Trading", "Total Meal Trading", "N. America"),
  c("L10WU3X", "Selma Trading", "Total Meal Trading", "N. America"),
  c("L42271C", "Lloydminister Processing", "Total Lloydminister", "N. America"),
  c("L42330X", "Blenheim Trading - 42330", "Total Windsor", "N. America"),
  c("L42368X", "Maidstone Trading - 42368", "Total Windsor", "N. America"),
  c("L42415C", "Watson Trading - 42415", "Total Seed Trading", "N. America"),
  c("L42415X", "Watson Trading - 42415", "Total Seed Trading", "N. America"),
  c("L42F20C", "Windsor Processing", "Total Windsor", "N. America"),
  c("L42N60C", "Carberry Trading - 42N60", "Total Seed Trading", "N. America"),
  c("L42N60X", "Carberry Trading - 42N60", "Total Seed Trading", "N. America"),
  c("L42NM8C", "Seed Trading - 42NM8", "Total Seed Trading", "N. America"),
  c("L42NM8X", "Seed Trading - 42NM8", "Total Seed Trading", "N. America"),
  c("L42NN2X", "Meal Trading - 42NN2", "Total Meal Trading", "N. America"),
  c("L42ST1X", "Strathray Trading - 42ST1", "Total Windsor", "N. America"),
  c("L5000MXRO", "Mexico City Trading", "Total Mexico City", "N. America"),
  c("L5000TROD", "Torreon Processing", "Total Torreon", "N. America"),
  c("L5500HC", "Spread Trading - 5500HC", "Total Spread Trading", "N. America"),
  c("L5500JO", "Spread Trading - 5500JO", "Total Spread Trading", "N. America"),
  c("L5501HC", "Spread Trading - 5501HC", "Total Spread Trading", "N. America"),
  c("L5504JO", "Softseed Trading - 5504", "Total Spread Trading", "N. America"),
  c("L5505HC", "Spread Trading - 5505HC", "Total Spread Trading", "N. America"),
  c("L5505JO", "Spread Trading - 5505JO", "Total Spread Trading", "N. America"),
  c("L5510JO", "Spread Trading - 5510", "Total Spread Trading", "N. America"),
  c("L5520JO", "Board Crush - 5520", "N. America Board Crush", "N. America"),
  c("L5600JO", "Spread Trading - 5600", "Total Spread Trading", "N. America"),
  c("L5620JO", "Spread Trading - 5620", "Total Spread Trading", "N. America"),
  c("L5675JO", "Spread Trading - 5675", "Total Spread Trading", "N. America"),
  c("L5842OD", "Crude Soybean Oil - 5842", "Total Soybean Oil", "N. America"),
  c("L5844HS", "Hi Oleic Soybean Oil - 5844", "Total Soybean Oil", "N. America"),
  c("L5850CLCO", "US Canola Oil - 5850", "Total Canola Oil", "N. America"),
  c("L5852CEC", "Hi Oleic Canola Oil - 5852", "Total Canola Oil", "N. America"),
  c("L5854CT", "Cottonseed Oil - 5854", "Total Cottonseed Oil", "N. America"),
  c("L5856CO", "Corn Oil - 5856", "Total Corn Oil", "N. America"),
  c("L5858TON", "Windsor Soybean Oil - 5858", "Total Windsor", "N. America"),
  c("L5860RPN", "Windsor Canola Oil - 5860", "Total Windsor", "N. America"),
  c("L5862LMUS", "Lloydminister Canoal Oil - 5862", "Total Lloydminister", "N. America"),
  c("L5864LMOC", "Lloydminister Hi Oleic RSO - 5864", "Total Lloydminister", "N. America"),
  c("L5880WOBO", "Soybean Oil - 5880WOBO", "Total World Oils", "N. America"),
  c("L5884WORS", "Canola Oil - 5884WORS", "Total World Oils", "N. America"),
  c("L5900JO", "Spread Trading - 5900", "Total Spread Trading", "N. America"),
  c("L6090JO", "Spread Trading - 6690", "Total Spread Trading", "Europe"),
  c("L6210JO", "Spyck Processing", "Total Spyck", "Europe"),
  c("L6251JO", "Spread Trading - 6251", "Total Spread Trading", "S. America"),
  c("L6261JO", "Board Crush - 6261", "Brazil Board Crush", "S. America"),
  c("L6365JO", "Spread Trading - 6365", "Total Spread Trading", "S. America"),
  c("L6375JO", "Paraguay Spread - 6375", "Total Spread Trading", "S. America"),
  c("L6392JO", "Board Crush - 6392", "Paraguay Board Crush", "S. America"),
  c("L6551JO", "Spread Trading - 6551JO", "Total Spread Trading", "S. America"),
  c("L6567JO", "Spread Trading - 6567", "Total Spread Trading", "S. America"),
  c("L6695JO", "Board Crush - 6695", "Europe Board Crush", "Europe"),
  c("L6827JO", "Spread Trading - 6827", "Total Spread Trading", "Europe"),
  c("LArgntnaX", "Argentina Trading", "Total Argentina", "S. America"),
  c("LBoliviaC", "Bolivia Processing", "Total Bolivia", "S. America"),
  c("LBrazilC", "Brazil Processing", "Total Brazil", "S. America"),
  c("LBrazilO", "Brazil Origination", "Total Brazil", "S. America"),
  c("LBrazilX", "Brazil Trading", "Total Brazil", "S. America"),
  c("LChileO", "Chile Origination", "Total Chile", "S. America"),
  c("LChileX", "Chile Trading", "Total Chile", "S. America"),
  c("LFR5JLC", "Illichivsk Processing", "Total Illichivsk", "Europe"),
  c("LHTGX4C", "Imez Processing", "Total Imez", "Europe"),
  c("LMG39JO", "Spread Trading - MG39", "Total Spread Trading", "Europe"),
  c("LMG70JO", "Spread Trading - MG70", "Total Spread Trading", "Europe"),
  c("LMG78JO", "Spread Trading - MG78", "Total Spread Trading", "Europe"),
  c("LMG90JO", "Spread Trading - MG79", "Total Spread Trading", "Europe"),
  c("LParaguayC", "Paraguay Processing", "Total Paraguay", "S. America"),
  c("LParaguayO", "Paraguay Origination", "Total Paraguay", "S. America"),
  c("LParaguayX", "Paraguay Trading", "Total Paraguay", "S. America"),
  c("LPeruO", "Peru Origination", "Total Peru", "S. America"),
  c("LPeruX", "Peru Trading", "Total Peru", "S. America"),
  c("LR9184C", "Torreon Processing", "Total Torreon", "N. America"),
  c("LR9867C", "Mexico City Processing", "Total Mexico City", "N. America"),
  c("LR9867X", "Mexico City Trading", "Total Mexico City", "N. America"),
  c("LR9BW5C", "Obregon Processing", "Total Obregon", "N. America"),
  c("LR9BW5X", "Obregon Trading", "Total Obregon", "N. America"),
  c("LSW808C", "Spyck Processing", "Total Spyck", "Europe"),
  c("LSW815C", "Europoort Processing", "Total Europoort", "Europe"),
  c("LSW815X", "Europoort Trading", "Total Europoort", "Europe"),
  c("LSW912C", "Erith Processing", "Total Erith", "Europe"),
  c("LSWLR6C", "Straubing Trading", "Total Straubing", "Europe"),
  c("LSWM01C", "Mainz Processing", "Total Mainz", "Europe"),
  c("LSWPH9C", "Olomouc Processing", "Total Olomouc", "Europe"),
  c("LSWQ92C", "Hamburg Processing", "Total Hamburg", "Europe"),
  c("LSWUT6C", "Imez Processing", "Total Imez", "Europe"),
  c("LSZWZTC", "Szamotuly Processing", "Total Szamotuly", "Europe"),
  c("LUruguayO", "Uruguay Origination", "Total Uruguay", "S. America"),
  c("LUSHEDGE", "US Hedging Center", "Total US Hedging Center", "N. America")
)
colnames(m) <- c("Entities", "Name", "Location", "Region")

#' @export
dim_entities <- as.data.frame(m)

# create a rda copy of the dimemsion table
devtools::use_data(dim_entities, overwrite = TRUE)

# inititate entitity dimension
m <- rbind(
  c("1110", "GOPSGRINV", "Seed Inventory", "Seed Flat Priced", "Seed Flat Position", "Seed Basis Position", "Seed Ownership"),
  c("1120", "GOGRSPOT", "Seed Crush-MTD", "Seed Flat Priced", "Seed Flat Position", "Seed Basis Position", "Seed Ownership"),
  c("1130", "GOGRFLTP", "Seed Purchase Flat", "Seed Flat Priced", "Seed Flat Position", "Seed Basis Position", "Seed Ownership"),
  c("1140", "GOGRFLTS", "Seed Sales Flat", "Seed Flat Priced", "Seed Flat Position", "Seed Basis Position", "Seed Ownership"),
  c("1150", "GOGROTHS", "Seed Purchase Flat Adj.", "Seed Flat Priced", "Seed Flat Position", "Seed Basis Position", "Seed Ownership"),
  c("1160", "GOGRBASP", "Seed Purchase Basis", "Seed Basis Priced", "Seed Flat Position", "Seed Basis Position", "Seed Ownership"),
  c("1170", "GOGRBASS", "Seed Sales Basis", "Seed Basis Priced", "Seed Flat Position", "Seed Basis Position", "Seed Ownership"),
  c("1210", "GOGROTHP", "Seed Purchase HTA", "Seed Purchase HTA", "", "", "Seed Ownership"),
  c("1220", "GOGRGIVES", "Seed Gives From Basis", "Seed Gives Takes", "Seed Flat Position", "", ""),
  c("1230", "GOGRTAKES", "Seed Takes from Basis", "Seed Gives Takes", "Seed Flat Position", "", ""),
  c("1240", "GOGRHDG", "Seed Hedge Futures", "Seed Hedge Futures", "Seed Flat Position", "", ""),
  c("1250", "GOGRCRADJ", "Seed Unused Weekly Crush", "Seed Hedge Futures", "Seed Flat Position", "", ""),
  c("2110", "GOPSMLINV", "Meal Inventory", "Meal Flat Priced", "Meal Flat Position", "Meal Basis Position", "Meal Sales"),
  c("2120", "GOMLSPOT", "Meal Production-MTD", "Meal Flat Priced", "Meal Flat Position", "Meal Basis Position", "Meal Sales"),
  c("2130", "GOMLFLTS", "Meal Sales Flat", "Meal Flat Priced", "Meal Flat Position", "Meal Basis Position", "Meal Sales"),
  c("2140", "GOMLFLTP", "Meal Purchase Flat", "Meal Flat Priced", "Meal Flat Position", "Meal Basis Position", "Meal Sales"),
  c("2150", "GOMLOTHP", "Meal Sales Flat Adj.", "Meal Flat Priced", "Meal Flat Position", "Meal Basis Position", "Meal Sales"),
  c("2160", "GOMLBASS", "Meal Sales Basis", "Meal Basis Priced", "Meal Flat Position", "Meal Basis Position", "Meal Sales"),
  c("2170", "GOMLBASP", "Meal Purchase Basis", "Meal Basis Priced", "Meal Flat Position", "Meal Basis Position", "Meal Sales"),
  c("2210", "GOMLOTHS", "Meal Sales Board Only", "Meal Sales Board Only", "", "", "Meal Sales"),
  c("2220", "GOMLGIVES", "Meal Gives From Basis", "Meal Gives Takes", "Meal Flat Position", "", ""),
  c("2230", "GOMLTAKES", "Meal Takes from Basis", "Meal Gives Takes", "Meal Flat Position", "", ""),
  c("2240", "GOMLHDG", "Meal Hedge Futures", "Meal Hedge Futures", "Meal Flat Position", "", ""),
  c("2250", "GOMLCRADJ", "Meal Unused Weekly Crush", "Meal Hedge Futures", "Meal Flat Position", "", ""),
  c("3110", "GOPSOLINV", "Oil Inventory", "Oil Flat Priced", "Oil Flat Position", "Oil Basis Position", "Oil Sales"),
  c("3120", "GOOLSPOT", "Oil Production-MTD", "Oil Flat Priced", "Oil Flat Position", "Oil Basis Position", "Oil Sales"),
  c("3130", "GOOLFLTS", "Oil Sales Flat", "Oil Flat Priced", "Oil Flat Position", "Oil Basis Position", "Oil Sales"),
  c("3140", "GOOLFLTP", "Oil Purchase Flat", "Oil Flat Priced", "Oil Flat Position", "Oil Basis Position", "Oil Sales"),
  c("3150", "GOOLOTHP", "Oil Sales Flat Adj.", "Oil Basis Priced", "Oil Flat Position", "Oil Basis Position", "Oil Sales"),
  c("3160", "GOOLBASS", "Oil Sales Basis", "Oil Basis Priced", "Oil Flat Position", "Oil Basis Position", "Oil Sales"),
  c("3170", "GOOLBASP", "Oil Purchase Basis", "Oil Flat Priced", "Oil Flat Position", "Oil Basis Position", "Oil Sales"),
  c("3210", "GOOLOTHS", "Oil Sales Board Only", "Oil Sales Board Only", "", "", "Oil Sales"),
  c("3220", "GOOLGIVES", "Oil Gives From Basis", "Oil Gives Takes", "Oil Flat Position", "", ""),
  c("3230", "GOOLTAKES", "Oil Takes from Basis", "Oil Gives Takes", "Oil Flat Position", "", ""),
  c("3240", "GOOLHDG", "Oil Hedge Futures", "Oil Hedge Futures", "Oil Flat Position", "", ""),
  c("3250", "GOOLCRADJ", "Oil Unused Weekly Crush", "Oil Hedge Futures", "Oil Flat Position", "", "")
)
colnames(m) <- c("AccountSort", "Accounts", "AccountLine1", "AccountLine2", "FlatPosition", "BasisPosition", "FreeToSell")

#' @export
dim_accounts <- as.data.frame(m)

# create a rda copy of the dimemsion table
devtools::use_data(dim_accounts, overwrite = TRUE)

