-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatLocation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

--main = putStrLn "ok"

data ChatLocation = 
 ChatLocation { address :: String, location :: Location.Location }  -- deriving (Show)

instance T.ToJSON ChatLocation where
 toJSON (ChatLocation { address = address, location = location }) =
  A.object [ "@type" A..= T.String "chatLocation", "address" A..= address, "location" A..= location ]
-- chatLocation ChatLocation  { address :: String, location :: Location.Location } 



instance T.FromJSON ChatLocation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatLocation" -> parseChatLocation v
  where
   parseChatLocation :: A.Value -> T.Parser ChatLocation
   parseChatLocation = A.withObject "ChatLocation" $ \o -> do
    address <- o A..: "address"
    location <- o A..: "location"
    return $ ChatLocation { address = address, location = location }