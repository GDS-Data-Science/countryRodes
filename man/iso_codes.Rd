\name{iso_codes}
\alias{iso_codes}

\title{Translation of Country Names and Country Codes}

\description{
Function \code{iso_codes} allows the user to translate a vector of country codes
or names to either the ISO-alpha3 format or to UNHCR's proGres-alpha3 format.
}

\usage{
iso_codes(  v, cm = NULL, type = c( "iso3_alpha3", "proGres_alpha3" ) )
}

\arguments{
  \item{v}{vector of character strings containing country names or country codes.}
  \item{cm}{Optional. Allows to determine the code format of the original data.
  Options are: 'english_name', 'french_name', 'gis_name', 'UNSD_name', 'iso3_alpha2',
  'iso3_num', 'noc_alpha3', 'noc_name', 'nato_alpha2', 'nato_alpha3', 'nato_name'
  'marc_alpha3', 'marc_name', 'itu_num', 'itu_alpha3', 'itu_names',	'fips_alpha2',
  'fips_name', 'undp_alpha3', 'undp_name', 'fao_name', 'fao_alpha3', 'lp_alpha3',
  'lp_name', 'wb_name', 'prio_name', 'unhcr_name'.
  This option should only be set if the type of the original country names or
  country codes is known to match an element in the list.
}
  \item{type}{Choice of final country code format.}
}

\details{
Function \code{iso_codes} takes a vector of country names or country codes and
translates them into the ISO-alpha3 or proGres code format.
In cases where a country name or country code is not found or cannot be uniquely identified,
the function returns \code{NA}.
In the latter case, the quality of the match can be improved by setting the \code{cm}
argument.
}

\value{
A vector or matrix of character strings containing either ISO-alpha3 country codes
or proGres-alpha3 country codes.
}

\author{
Geraldine Henningsen
}

\examples{
# vector of country names
vect <- c( "Armenia", "Aruba", "Australia" )
iso_codes( vect )
iso_codes( vect, "UNSD_name", type = "proGres_alpha3" )
iso_codes( vect, type = "iso3_alpha3" )

# data frame with country names
df <- data.frame( country = rep( c( "Australia", "Aruba", "Armenia" ), each = 3 ),
                  year = rep( c( 2009:2011 ), 3 ),
                  gdp = round( rnorm( 9, 5000, 2000 ), 0 ))

df$iso3 <- iso_codes( df[ , 1], type = "iso3_alpha3" )
}
