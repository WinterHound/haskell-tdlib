-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPersonalDocument where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- A personal document to be saved to Telegram Passport 
-- 
-- __files__ List of files containing the pages of the document
-- 
-- __translation__ List of files containing a certified English translation of the document
data InputPersonalDocument = 

 InputPersonalDocument { translation :: Maybe [InputFile.InputFile], files :: Maybe [InputFile.InputFile] }  deriving (Eq)

instance Show InputPersonalDocument where
 show InputPersonalDocument { translation=translation, files=files } =
  "InputPersonalDocument" ++ cc [p "translation" translation, p "files" files ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InputPersonalDocument where
 toJSON InputPersonalDocument { translation = translation, files = files } =
  A.object [ "@type" A..= T.String "inputPersonalDocument", "translation" A..= translation, "files" A..= files ]

instance T.FromJSON InputPersonalDocument where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputPersonalDocument" -> parseInputPersonalDocument v
   _ -> mempty
  where
   parseInputPersonalDocument :: A.Value -> T.Parser InputPersonalDocument
   parseInputPersonalDocument = A.withObject "InputPersonalDocument" $ \o -> do
    translation <- o A..:? "translation"
    files <- o A..:? "files"
    return $ InputPersonalDocument { translation = translation, files = files }
 parseJSON _ = mempty
