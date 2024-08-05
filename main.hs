{-# LANGUAGE OverloadedStrings #-}

import           HelperFuncs
import           Data.Aeson            (Value, ToJSON, fromJSON, FromJSON)
import qualified Data.ByteString.Char8 as S8
import qualified Data.Yaml             as Yaml
import           Network.HTTP.Simple
import GHC.Generics (Generic)
import Data.Text as T
import CurrentWeatherTypes
import FutureWeatherTypes
import qualified Data.ByteString.Char8 as Text
import Data.Yaml.Builder (toByteString)

import qualified Data.Text.IO as T

main :: IO ()
main = do
    --Get Input from the User - Location for Weather Forecast, days ahead to Forecast
    putStrLn "Enter the Location you want a Weather Forecast For: "
    a <- getLine
    let entered_location = a
    putStrLn "Enter the number of Days ahead you want a Prediction (0 = Today's Weather): "
    b <- getLine
    let days = read b :: Int
    
    if days > 0 then do
        putStrLn ("Ok, we'll do a forecast for " ++ entered_location ++ ", " ++ show days ++ " days ahead.") 
        --Get the Forecasted Weather
        let forecastURL = constructForecastURL entered_location days
        
        request <- parseRequest forecastURL
        response <- httpJSON request

        let weather_forecast = (getResponseBody response :: WeatherForecast)
        
        weather_forecast_text <- writeWeatherForForecast (forecast weather_forecast)

        T.putStrLn weather_forecast_text

    else do 
        putStrLn ("Ok, we'll get the current weather in " ++ entered_location ++ ".")
        let currentURL = constructCurrentURL entered_location

        request <- parseRequest currentURL
        response <- httpJSON request

        let weather_today = (getResponseBody response :: WeatherToday)

        weather_today_text <- writeWeatherToday weather_today
        
        T.putStrLn weather_today_text