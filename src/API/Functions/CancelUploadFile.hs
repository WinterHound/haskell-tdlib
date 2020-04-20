-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CancelUploadFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CancelUploadFile = 
 CancelUploadFile { file_id :: Int }  -- deriving (Show)

instance T.ToJSON CancelUploadFile where
 toJSON (CancelUploadFile { file_id = file_id }) =
  A.object [ "@type" A..= T.String "cancelUploadFile", "file_id" A..= file_id ]
-- cancelUploadFile CancelUploadFile  { file_id :: Int } 



instance T.FromJSON CancelUploadFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "cancelUploadFile" -> parseCancelUploadFile v
  where
   parseCancelUploadFile :: A.Value -> T.Parser CancelUploadFile
   parseCancelUploadFile = A.withObject "CancelUploadFile" $ \o -> do
    file_id <- o A..: "file_id"
    return $ CancelUploadFile { file_id = file_id }