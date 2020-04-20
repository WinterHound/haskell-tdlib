-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Emojis where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Emojis = 
 Emojis { emojis :: [String] }  -- deriving (Show)

instance T.ToJSON Emojis where
 toJSON (Emojis { emojis = emojis }) =
  A.object [ "@type" A..= T.String "emojis", "emojis" A..= emojis ]
-- emojis Emojis  { emojis :: [String] } 



instance T.FromJSON Emojis where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "emojis" -> parseEmojis v
  where
   parseEmojis :: A.Value -> T.Parser Emojis
   parseEmojis = A.withObject "Emojis" $ \o -> do
    emojis <- o A..: "emojis"
    return $ Emojis { emojis = emojis }