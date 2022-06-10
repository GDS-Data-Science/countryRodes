codes <- function( x, cm, CountryRodesData ){
   # search for entries
   df = which( CountryRodesData == x, arr.ind = TRUE )
   # return row
   res = if( length( unique( df[ , 1 ])) == 1 ){
      df[ 1, 1 ]
   }else if( !is.null( cm )){
      if( which( names( CountryRodesData ) == cm ) %in% df[ , 2 ] ) {
         df[ df[ , 2 ] == which( names( CountryRodesData ) == cm ), 1 ]
      } else {
         NA
      }
   }else{
      NA
   }
   return( res )
}
