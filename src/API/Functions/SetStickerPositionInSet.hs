-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetStickerPositionInSet where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data SetStickerPositionInSet = 
 SetStickerPositionInSet { position :: Maybe Int, sticker :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON SetStickerPositionInSet where
 toJSON (SetStickerPositionInSet { position = position, sticker = sticker }) =
  A.object [ "@type" A..= T.String "setStickerPositionInSet", "position" A..= position, "sticker" A..= sticker ]

instance T.FromJSON SetStickerPositionInSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setStickerPositionInSet" -> parseSetStickerPositionInSet v
   _ -> mempty
  where
   parseSetStickerPositionInSet :: A.Value -> T.Parser SetStickerPositionInSet
   parseSetStickerPositionInSet = A.withObject "SetStickerPositionInSet" $ \o -> do
    position <- optional $ o A..: "position"
    sticker <- optional $ o A..: "sticker"
    return $ SetStickerPositionInSet { position = position, sticker = sticker }