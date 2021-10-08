-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CleanFileName where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Removes potentially dangerous characters from the name of a file. The encoding of the file name is supposed to be UTF-8. Returns an empty string on failure. Can be called synchronously 
-- 
-- __file_name__ File name or path to the file
data CleanFileName = 

 CleanFileName { file_name :: Maybe String }  deriving (Eq)

instance Show CleanFileName where
 show CleanFileName { file_name=file_name } =
  "CleanFileName" ++ cc [p "file_name" file_name ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON CleanFileName where
 toJSON CleanFileName { file_name = file_name } =
  A.object [ "@type" A..= T.String "cleanFileName", "file_name" A..= file_name ]

instance T.FromJSON CleanFileName where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "cleanFileName" -> parseCleanFileName v
   _ -> mempty
  where
   parseCleanFileName :: A.Value -> T.Parser CleanFileName
   parseCleanFileName = A.withObject "CleanFileName" $ \o -> do
    file_name <- o A..:? "file_name"
    return $ CleanFileName { file_name = file_name }
 parseJSON _ = mempty
