-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineQueryResults where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InlineQueryResult as InlineQueryResult

-- |
-- 
-- Represents the results of the inline query. Use sendInlineQueryResultMessage to send the result of the query 
-- 
-- __inline_query_id__ Unique identifier of the inline query
-- 
-- __next_offset__ The offset for the next request. If empty, there are no more results
-- 
-- __results__ Results of the query
-- 
-- __switch_pm_text__ If non-empty, this text must be shown on the button, which opens a private chat with the bot and sends the bot a start message with the switch_pm_parameter
-- 
-- __switch_pm_parameter__ Parameter for the bot start message
data InlineQueryResults = 

 InlineQueryResults { switch_pm_parameter :: Maybe String, switch_pm_text :: Maybe String, results :: Maybe [InlineQueryResult.InlineQueryResult], next_offset :: Maybe String, inline_query_id :: Maybe Int }  deriving (Eq)

instance Show InlineQueryResults where
 show InlineQueryResults { switch_pm_parameter=switch_pm_parameter, switch_pm_text=switch_pm_text, results=results, next_offset=next_offset, inline_query_id=inline_query_id } =
  "InlineQueryResults" ++ cc [p "switch_pm_parameter" switch_pm_parameter, p "switch_pm_text" switch_pm_text, p "results" results, p "next_offset" next_offset, p "inline_query_id" inline_query_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InlineQueryResults where
 toJSON InlineQueryResults { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, results = results, next_offset = next_offset, inline_query_id = inline_query_id } =
  A.object [ "@type" A..= T.String "inlineQueryResults", "switch_pm_parameter" A..= switch_pm_parameter, "switch_pm_text" A..= switch_pm_text, "results" A..= results, "next_offset" A..= next_offset, "inline_query_id" A..= inline_query_id ]

instance T.FromJSON InlineQueryResults where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inlineQueryResults" -> parseInlineQueryResults v
   _ -> mempty
  where
   parseInlineQueryResults :: A.Value -> T.Parser InlineQueryResults
   parseInlineQueryResults = A.withObject "InlineQueryResults" $ \o -> do
    switch_pm_parameter <- o A..:? "switch_pm_parameter"
    switch_pm_text <- o A..:? "switch_pm_text"
    results <- o A..:? "results"
    next_offset <- o A..:? "next_offset"
    inline_query_id <- mconcat [ o A..:? "inline_query_id", readMaybe <$> (o A..: "inline_query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ InlineQueryResults { switch_pm_parameter = switch_pm_parameter, switch_pm_text = switch_pm_text, results = results, next_offset = next_offset, inline_query_id = inline_query_id }
 parseJSON _ = mempty
