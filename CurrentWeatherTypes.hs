{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module CurrentWeatherTypes where
import Data.Text (Text, pack)
import BaseWeatherTypes hiding (precip_mm, humidity, wind_kph, temp_c, condition)
import GHC.Generics (Generic)
import Data.Aeson (ToJSON, FromJSON)
import qualified Data.ByteString.Char8 as Text
import qualified Text.Show
import GHC.IO.Device (RawIO(write))
import HelperFuncs (writeFloat, writeInt)

data CurrentWeather = CurrentWeather {
    last_updated_epoch :: Int,
    last_updated :: Text,
    temp_c :: Float,
    temp_f :: Float,
    is_day :: Int,
    condition :: Condition,
    wind_mph :: Float,
    wind_kph :: Float,
    wind_degree :: Int,
    wind_dir :: Text,
    pressure_mb :: Float,
    pressure_in :: Float,
    precip_mm :: Float,
    precip_in :: Float,
    humidity :: Int,
    cloud :: Int,
    feelslike_c :: Float,
    feelslike_f :: Float,
    windchill_c :: Float,
    windchill_f :: Float,
    heatindex_c :: Float,
    heatindex_f :: Float,
    dewpoint_c :: Float,
    dewpoint_f :: Float,
    vis_km :: Float,
    vis_miles :: Float,
    uv :: Float,
    gust_mph :: Float,
    gust_kph :: Float
    }
    deriving (Generic, Show)

instance ToJSON CurrentWeather
instance FromJSON CurrentWeather

data WeatherToday = WeatherToday {
    location :: Location,
    current :: CurrentWeather
    }
    deriving (Generic, Show)

instance ToJSON WeatherToday
instance FromJSON WeatherToday


writeWeatherToday :: WeatherToday -> IO Text
writeWeatherToday weather = do
    let current_weather :: CurrentWeather = current weather

    let output :: Text = "It is " <> text (condition current_weather) <> " in " <> name (location weather) <> ", with a Temperature of " <> writeFloat (temp_c current_weather) <> "°C, a Wind Speed of " <> 
                        writeFloat (wind_kph current_weather) <> " Kilometres per hour, A Precipitation of " <> writeFloat (precip_mm current_weather) <> "mm, and a Humidity of "
                        <> writeInt (humidity current_weather) <> "%."

    pure output