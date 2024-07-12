# source(here::here("lib/states/co", "statewide.R"))
# source(here::here("lib/states/az", "statewide.R"))
source(here::here("lib/states/tx", "statewide.R"))
source(here::here("lib", "opp.R"))

print("TEST")
tx_raw_data_path <- "/share/pierson/non_public_open_policing_data/updated_raw_openpolicing_data/raw/2019_raw/tx_statewide/raw_csv"
result <- load_raw(tx_raw_data_path, Inf)
state <- "tx"
city <- "statewide"
  helpers <- c(
    "add_lat_lng" = opp_add_lat_lng_func(state, city),
    "add_search_basis" = opp_add_search_basis_func(state, city),
    "add_type" = opp_add_type_func(state, city),
    "add_contraband_type" = opp_add_contraband_types_func(state, city),
    "add_shapefiles_data" = opp_add_shapefiles_data_func(state, city),
    "add_county_from_highway_milepost" = 
      opp_add_county_from_highway_milepost_func(state, city),
    "fips_to_county_name" = opp_fips_to_county_name_func(state),
    "load_json" = opp_load_json_func(state, city),
    "load_csv" = opp_load_csv_func(state, city)
  )
clean(result, helpers)