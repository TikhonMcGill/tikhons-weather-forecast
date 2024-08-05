{-# LANGUAGE DeriveGeneric #-}

module BaseWeatherTypes where
import Data.Text (Text)
import GHC.Generics (Generic)
import Data.Aeson (FromJSON, ToJSON)

--A Weather Condition, e.g. "Cloudy"
data Condition = Condition {
    text :: Text,
    icon :: Text,
    code :: Int
    }
    deriving (Generic, Show)

instance ToJSON Condition
instance FromJSON Condition


data Hour = Hour {
    time_epoch :: Int,
    time :: Text,
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
    snow_cm :: Float,
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
    will_it_rain :: Int,
    chance_of_rain :: Int,
    will_it_snow :: Int,
    chance_of_snow :: Int,
    vis_km :: Float,
    vis_miles :: Float,
    gust_mph :: Float,
    gust_kph :: Float,
    uv :: Float
    }
    deriving (Generic, Show)

instance ToJSON Hour
instance FromJSON Hour

--Data about a Location for which the Forecast is made
data Location = Location {
    name :: Text,
    region :: Text,
    country :: Text,
    lat :: Float,
    lon :: Float,
    tz_id :: Text,
    localtime_epoch :: Int,
    localtime :: Text
    }
    deriving (Generic, Show)

instance ToJSON Location
instance FromJSON Location

data AstronomicData = AstronomicData {
    sunrise :: Text,
    sunset :: Text,
    moonrise :: Text,
    moonset :: Text,
    moon_phase :: Text,
    moon_illumination :: Int,
    is_moon_up :: Int,
    is_sun_up :: Int
    }
    deriving (Generic, Show)

instance ToJSON AstronomicData
instance FromJSON AstronomicData