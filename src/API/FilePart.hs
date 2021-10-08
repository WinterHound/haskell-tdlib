-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FilePart where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains a part of a file 
-- 
-- __data__ File bytes
data FilePart = 

 FilePart { _data :: Maybe String }  deriving (Eq)

instance Show FilePart where
 show FilePart { _data=_data } =
  "FilePart" ++ cc [p "_data" _data ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON FilePart where
 toJSON FilePart { _data = _data } =
  A.object [ "@type" A..= T.String "filePart", "data" A..= _data ]

instance T.FromJSON FilePart where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "filePart" -> parseFilePart v
   _ -> mempty
  where
   parseFilePart :: A.Value -> T.Parser FilePart
   parseFilePart = A.withObject "FilePart" $ \o -> do
    _data <- o A..:? "data"
    return $ FilePart { _data = _data }
 parseJSON _ = mempty
