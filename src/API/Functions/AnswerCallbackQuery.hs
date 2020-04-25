-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerCallbackQuery where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AnswerCallbackQuery = 
 AnswerCallbackQuery { cache_time :: Maybe Int, url :: Maybe String, show_alert :: Maybe Bool, text :: Maybe String, callback_query_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AnswerCallbackQuery where
 toJSON (AnswerCallbackQuery { cache_time = cache_time, url = url, show_alert = show_alert, text = text, callback_query_id = callback_query_id }) =
  A.object [ "@type" A..= T.String "answerCallbackQuery", "cache_time" A..= cache_time, "url" A..= url, "show_alert" A..= show_alert, "text" A..= text, "callback_query_id" A..= callback_query_id ]

instance T.FromJSON AnswerCallbackQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerCallbackQuery" -> parseAnswerCallbackQuery v
   _ -> mempty
  where
   parseAnswerCallbackQuery :: A.Value -> T.Parser AnswerCallbackQuery
   parseAnswerCallbackQuery = A.withObject "AnswerCallbackQuery" $ \o -> do
    cache_time <- mconcat [ o A..:? "cache_time", readMaybe <$> (o A..: "cache_time" :: T.Parser String)] :: T.Parser (Maybe Int)
    url <- o A..:? "url"
    show_alert <- o A..:? "show_alert"
    text <- o A..:? "text"
    callback_query_id <- mconcat [ o A..:? "callback_query_id", readMaybe <$> (o A..: "callback_query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AnswerCallbackQuery { cache_time = cache_time, url = url, show_alert = show_alert, text = text, callback_query_id = callback_query_id }