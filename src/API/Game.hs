-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Game where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

data Game = 
 Game { animation :: Maybe Animation.Animation, photo :: Maybe Photo.Photo, description :: Maybe String, text :: Maybe FormattedText.FormattedText, title :: Maybe String, short_name :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Game where
 toJSON (Game { animation = animation, photo = photo, description = description, text = text, title = title, short_name = short_name, _id = _id }) =
  A.object [ "@type" A..= T.String "game", "animation" A..= animation, "photo" A..= photo, "description" A..= description, "text" A..= text, "title" A..= title, "short_name" A..= short_name, "id" A..= _id ]

instance T.FromJSON Game where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "game" -> parseGame v
   _ -> mempty
  where
   parseGame :: A.Value -> T.Parser Game
   parseGame = A.withObject "Game" $ \o -> do
    animation <- o A..:? "animation"
    photo <- o A..:? "photo"
    description <- o A..:? "description"
    text <- o A..:? "text"
    title <- o A..:? "title"
    short_name <- o A..:? "short_name"
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Game { animation = animation, photo = photo, description = description, text = text, title = title, short_name = short_name, _id = _id }