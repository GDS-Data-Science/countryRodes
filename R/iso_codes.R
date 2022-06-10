iso_codes <- function( v, cm = NULL, type = c( "iso3_alpha3", "proGres_alpha3" )){
   # load data set with codes
   CountryRodesData = read.csv( system.file( "extdata", "CountryRodesData.csv",
                                              package = "CountryRodes" ))
   rows <- unlist( lapply( v, codes, cm = cm, CountryRodesData = CountryRodesData ))

   # add a row to CountryRodesData for unknown countries
   CountryRodesData <- rbind( CountryRodesData, NA )
   rows[ is.na( rows ) ] <- nrow( CountryRodesData )

   iso_c <- CountryRodesData[ rows, type ]
   return( iso_c )
}
