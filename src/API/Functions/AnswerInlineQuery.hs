-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AnswerInlineQuery where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputInlineQueryResult as InputInlineQueryResult

data AnswerInlineQuery = 
 AnswerInlineQuery { switch_pm_parameter :: Maybe String, switch_pm_text :: Maybe String, next_offset :: Maybe String, cache_time :: Maybe Int, results :: Maybe [InputInlineQueryResult.InputInlineQueryResult], is_personal :: Maybe Bool, inline_query_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AnswerInlineQuery where
 toJSON (AnswerInlineQuery { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, next_offset = next_offset, cache_time = cache_time, results = results, is_personal = is_personal, inline_query_id = inline_query_id }) =
  A.object [ "@type" A..= T.String "answerInlineQuery", "switch_pm_parameter" A..= switch_pm_parameter, "switch_pm_text" A..= switch_pm_text, "next_offset" A..= next_offset, "cache_time" A..= cache_time, "results" A..= results, "is_personal" A..= is_personal, "inline_query_id" A..= inline_query_id ]

instance T.FromJSON AnswerInlineQuery where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "answerInlineQuery" -> parseAnswerInlineQuery v
   _ -> mempty
  where
   parseAnswerInlineQuery :: A.Value -> T.Parser AnswerInlineQuery
   parseAnswerInlineQuery = A.withObject "AnswerInlineQuery" $ \o -> do
    switch_pm_parameter <- optional $ o A..: "switch_pm_parameter"
    switch_pm_text <- optional $ o A..: "switch_pm_text"
    next_offset <- optional $ o A..: "next_offset"
    cache_time <- optional $ o A..: "cache_time"
    results <- optional $ o A..: "results"
    is_personal <- optional $ o A..: "is_personal"
    inline_query_id <- optional $ o A..: "inline_query_id"
    return $ AnswerInlineQuery { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, next_offset = next_offset, cache_time = cache_time, results = results, is_personal = is_personal, inline_query_id = inline_query_id }