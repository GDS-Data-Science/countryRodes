iso_names <- function( v, cm = NULL, type = c( "english_name", "un_names")){
   # load data set with codes
   CountryRodesData = read.csv( system.file( "extdata", "CountryRodesData.csv",
                                             package = "CountryRodes") ,
                                             fileEncoding = "cp1252" )
   rows <- unlist( lapply( v, codes, cm = cm, CountryRodesData = CountryRodesData ))

   # add a row to CountryRodesData for unknown countries
   CountryRodesData <- rbind( CountryRodesData, NA )
   rows[ is.na( rows ) ] <- nrow( CountryRodesData )

   iso_c <- CountryRodesData[ rows, type ]
   return( iso_c )
}


# c( "english_name", "spanish_name", "UNSD_name", "nato_name",
#    "marc_name", "itu_names", "fips_name", "undp_name",
#    "fao_name", "lp_name", "wb_name", "prio_name", "un_names")
