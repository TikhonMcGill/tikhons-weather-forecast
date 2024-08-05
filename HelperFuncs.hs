{-# LANGUAGE OverloadedStrings #-}

module HelperFuncs where
import Data.Text (Text, pack)
api_key :: String = "YOUR API KEY HERE"

constructCurrentURL :: String -> String
constructCurrentURL location = "http://api.weatherapi.com/v1/current.json?q=" ++ location ++ "&key=" ++ api_key

constructForecastURL :: String -> Int -> String
constructForecastURL location days = "http://api.weatherapi.com/v1/forecast.json?q=" ++ location ++ "&days=" ++ show days ++ "&key=" ++ api_key

writeFloat :: Float -> Text
writeFloat f = pack (show f)

writeInt :: Int -> Text
writeInt i = pack (show i)