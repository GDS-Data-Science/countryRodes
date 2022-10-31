\name{iso_names}
\alias{iso_names}

\title{Translation of Country Names and Country Codes}

\description{
Function \code{iso_names} allows the user to translate a vector of country codes
or names to multiple country name formats.
}

\usage{
iso_names(  v, cm = NULL, type = c( "english_name", "un_names" ))
}

\arguments{
  \item{v}{vector of character strings containing country names or country codes.}
  \item{cm}{Optional. Allows to determine the code format of the original data.
  Options are: 'english_name', 'french_name', 'gis_name', 'UNSD_name', 'iso3_alpha2',
  'iso3_num', 'noc_alpha3', 'noc_name', 'nato_alpha2', 'nato_alpha3', 'nato_name'
  'marc_alpha3', 'marc_name', 'itu_num', 'itu_alpha3', 'itu_names',	'fips_alpha2',
  'fips_name', 'undp_alpha3', 'undp_name', 'fao_name', 'fao_alpha3', 'lp_alpha3',
  'lp_name', 'wb_name', 'prio_name'.
  This option should only be set if the type of the original country names or
  country codes is known to match an element in the list.
}
  \item{type}{Choice of final country name format.
  Options are: Options are: 'english_name', 'french_name', 'gis_name', 'UNSD_name',
  'noc_name', 'nato_name, 'marc_name', 'itu_names', 'fips_name', 'undp_name', 'fao_name',
  'lp_name', 'wb_name', 'prio_name'.}
}

\details{
Function \code{iso_names} takes a vector of country names or country codes and
translates them into multiple country name formats.
In cases where a country name or country code is not found or cannot be uniquely identified,
the function returns \code{NA}.
In the latter case, the quality of the match can be improved by setting the \code{cm}
argument.
}

\value{
A vector or matrix of character strings containing either english country names
or UN standard country names.
}

\author{
Geraldine Henningsen
}

\examples{
# vector of country names
vect <- c( "SPA", "FRA")
iso_codes( vect )
iso_codes( vect, "iso3_alpha3", type = "UNSD_name" )
iso_codes( vect, type = "UNSD_name" )

# data frame with country names
df <- data.frame( country = rep( c( "FRA", "SPA"), each = 3 ),
                  year = rep( c( 2009:2011 ), 3 ),
                  gdp = round( rnorm( 9, 5000, 2000 ), 0 ))

df$iso3_name <- iso_codes( df[ , 1], type = "iso3_alpha3" )
}

