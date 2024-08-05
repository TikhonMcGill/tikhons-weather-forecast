# Tikhon's Weather Forecast

## Introduction

There is a much-more important project in Haskell that I'm doing, and for it I have to
learn not only Haskell, but APIs also.

This project is something of a concrete artifact that shows I've actually learned something.

This utilizes the free API from [weatherapi.com](https://www.weatherapi.com/). 

## Features

This is a very simple command-line program in Haskell.

It lets you enter the Location you want a Weather Forecast for, and the number of days you
want a forecast for. If you enter 0 Days, you get today's weather instead. 

The Weather information you get is the "Condition" Name (e.g. "Cloudy", etc.), Temperature (celsius),
Wind Speed (kmph), Precipitation (mm) and Humidity (%).

Despite the simple information, the API calls produce Haskell Objects with considerably more data than
what is outputted - there's weather data in other units (e.g. Temperature in Fahrenheit), data about snow,
forecasts for *every hour* of each day forecasted (I just used maximums/averages), and even astrological data
(e.g. phases of the moon). Feel free to play around with it - I'm sure you'll make much better work of this than me!

## Instructions

To run these scripts, an installation of Haskell is needed.

This is best done through [ghcup](https://www.haskell.org/ghcup/install/) - my Antivirus (Avast) didn't like ghcup, so I had to turn
it off while installing.

What you then need is a Developer Account on [weatherapi.com](https://www.weatherapi.com/), in order to get an API Key.

Finally, once you have an API Key, in the HelperFuncs.hs script, replace the value of "api_key" with your API key.

That should be it!

## P.S. 

Apologies for my horrendous Haskell, I've been learning it less than a month! 