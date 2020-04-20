-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInstalledStickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetInstalledStickerSets = 
 GetInstalledStickerSets { is_masks :: Bool }  -- deriving (Show)

instance T.ToJSON GetInstalledStickerSets where
 toJSON (GetInstalledStickerSets { is_masks = is_masks }) =
  A.object [ "@type" A..= T.String "getInstalledStickerSets", "is_masks" A..= is_masks ]
-- getInstalledStickerSets GetInstalledStickerSets  { is_masks :: Bool } 



instance T.FromJSON GetInstalledStickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInstalledStickerSets" -> parseGetInstalledStickerSets v
  where
   parseGetInstalledStickerSets :: A.Value -> T.Parser GetInstalledStickerSets
   parseGetInstalledStickerSets = A.withObject "GetInstalledStickerSets" $ \o -> do
    is_masks <- o A..: "is_masks"
    return $ GetInstalledStickerSets { is_masks = is_masks }