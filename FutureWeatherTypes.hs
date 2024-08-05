{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module FutureWeatherTypes where
import Data.Text (Text, pack)
import BaseWeatherTypes hiding (condition)
import CurrentWeatherTypes (CurrentWeather)
import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON)
import HelperFuncs (writeFloat, writeInt)

data ForecastDay = ForecastDay {
    date :: Text,
    date_epoch :: Int,
    day :: Day,
    astro :: AstronomicData,
    hour :: [Hour]
    }
    deriving (Generic, Show)

instance ToJSON ForecastDay
instance FromJSON ForecastDay

data Forecast = Forecast {
        forecastday :: [ForecastDay]
    }
    deriving (Generic, Show)

instance ToJSON Forecast
instance FromJSON Forecast

data Day = Day {
    maxtemp_c :: Float,
    maxtemp_f :: Float,
    mintemp_c :: Float,
    mintemp_f :: Float,
    avgtemp_c :: Float,
    avgtemp_f :: Float,
    maxwind_mph :: Float,
    maxwind_kph :: Float,
    totalprecip_mm :: Float,
    totalprecip_in :: Float,
    totalsnow_cm :: Float,
    avgvis_km :: Float,
    avgvis_miles :: Float,
    avghumidity :: Int,
    daily_will_it_rain :: Int,
    daily_chance_of_rain :: Int,
    daily_will_it_snow :: Int,
    daily_chance_of_snow :: Int,
    condition :: Condition,
    uv :: Float
    }
    deriving (Generic, Show)

instance ToJSON Day
instance FromJSON Day

data WeatherForecast = WeatherForecast {
    location :: Location,
    current :: CurrentWeather,
    forecast :: Forecast
    }
    deriving (Generic, Show)

instance ToJSON WeatherForecast
instance FromJSON WeatherForecast

getWeatherForecastDayText :: ForecastDay -> Text
getWeatherForecastDayText forecast_day =
    "On " <> date forecast_day <> ", it will be " <> text (condition fday) <> ", with an Average Temperature of " <> writeFloat (avgtemp_c fday) <> "°C, Maximum Wind Speed of " <> 
    writeFloat (maxwind_kph fday) <> "Kilometres Per hour, A Total Precipitation of " <> writeFloat (totalprecip_mm fday) <> "mm, and a Humidity of " <> writeInt (avghumidity fday) <> "%."

    where fday = day forecast_day

writeWeatherForForecastDay :: ForecastDay -> IO Text
writeWeatherForForecastDay forecast_day = pure (getWeatherForecastDayText forecast_day)

writeWeatherForForecast :: Forecast -> IO Text
writeWeatherForForecast forecast = do
    let output :: Text = pack (concatMap (show . getWeatherForecastDayText) (forecastday forecast) )
    pure output