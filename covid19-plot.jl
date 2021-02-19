using Plots
using CSV
using DataFrames
using Dates

const URL = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
which_country = ["Philippines", "US", "India", "Sweden"]

function plotter(which_country, url)
    download(url, "covid_data.csv")
    df = CSV.read("covid_data.csv", DataFrame)
    rename!(df, 1 => "province", 2 => "country")
    countries = collect(df[:, 2])
    df_row = findfirst(countries .== which_country)
    df_data_row = df[df_row, :]
    country_data = convert(Vector, df_data_row[5:end]) .+ 1  # to remove zeroes
    return country_data
end
theme(:dark)
PH = plotter(which_country[1], URL)
US = plotter(which_country[2], URL)
IN = plotter(which_country[3], URL)
SW = plotter(which_country[4], URL)
date_format = Dates.DateFormat("m/d/Y")
date_strings = String.(names(CSV.read("covid_data.csv", DataFrame)))[5:end]
dates = parse.(Date, date_strings, date_format) + Year(2000)
gr()
plot(dates,[PH, US, SW, IN], ylabel="Confirmed cases", label=["Philippines" "United States" "Sweden" "India"], title="Philippines, US, Sweden, & India confirmed COVID-19 cases (log10)", xticks=dates[1:20:end], xrotation=45, leg=:topleft, yscale=:log10, size=(700, 450))
savefig("covid19plot.png")

