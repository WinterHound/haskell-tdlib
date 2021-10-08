-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInlineQueryResults where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Location as Location

-- |
-- 
-- Sends an inline query to a bot and returns its results. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires
-- 
-- __bot_user_id__ The identifier of the target bot
-- 
-- __chat_id__ Identifier of the chat where the query was sent
-- 
-- __user_location__ Location of the user; pass null if unknown or the bot doesn't need user's location
-- 
-- __query__ Text of the query
-- 
-- __offset__ Offset of the first entry to return
data GetInlineQueryResults = 

 GetInlineQueryResults { offset :: Maybe String, query :: Maybe String, user_location :: Maybe Location.Location, chat_id :: Maybe Int, bot_user_id :: Maybe Int }  deriving (Eq)

instance Show GetInlineQueryResults where
 show GetInlineQueryResults { offset=offset, query=query, user_location=user_location, chat_id=chat_id, bot_user_id=bot_user_id } =
  "GetInlineQueryResults" ++ cc [p "offset" offset, p "query" query, p "user_location" user_location, p "chat_id" chat_id, p "bot_user_id" bot_user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetInlineQueryResults where
 toJSON GetInlineQueryResults { offset = offset, query = query, user_location = user_location, chat_id = chat_id, bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "getInlineQueryResults", "offset" A..= offset, "query" A..= query, "user_location" A..= user_location, "chat_id" A..= chat_id, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON GetInlineQueryResults where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInlineQueryResults" -> parseGetInlineQueryResults v
   _ -> mempty
  where
   parseGetInlineQueryResults :: A.Value -> T.Parser GetInlineQueryResults
   parseGetInlineQueryResults = A.withObject "GetInlineQueryResults" $ \o -> do
    offset <- o A..:? "offset"
    query <- o A..:? "query"
    user_location <- o A..:? "user_location"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetInlineQueryResults { offset = offset, query = query, user_location = user_location, chat_id = chat_id, bot_user_id = bot_user_id }
 parseJSON _ = mempty
