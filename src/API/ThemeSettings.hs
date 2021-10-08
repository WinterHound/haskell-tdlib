-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ThemeSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.BackgroundFill as BackgroundFill
import {-# SOURCE #-} qualified API.Background as Background

-- |
-- 
-- Describes theme settings
-- 
-- __accent_color__ Theme accent color in ARGB format
-- 
-- __background__ The background to be used in chats; may be null
-- 
-- __outgoing_message_fill__ The fill to be used as a background for outgoing messages
-- 
-- __animate_outgoing_message_fill__ If true, the freeform gradient fill needs to be animated on every sent message
-- 
-- __outgoing_message_accent_color__ Accent color of outgoing messages in ARGB format
data ThemeSettings = 

 ThemeSettings { outgoing_message_accent_color :: Maybe Int, animate_outgoing_message_fill :: Maybe Bool, outgoing_message_fill :: Maybe BackgroundFill.BackgroundFill, background :: Maybe Background.Background, accent_color :: Maybe Int }  deriving (Eq)

instance Show ThemeSettings where
 show ThemeSettings { outgoing_message_accent_color=outgoing_message_accent_color, animate_outgoing_message_fill=animate_outgoing_message_fill, outgoing_message_fill=outgoing_message_fill, background=background, accent_color=accent_color } =
  "ThemeSettings" ++ cc [p "outgoing_message_accent_color" outgoing_message_accent_color, p "animate_outgoing_message_fill" animate_outgoing_message_fill, p "outgoing_message_fill" outgoing_message_fill, p "background" background, p "accent_color" accent_color ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ThemeSettings where
 toJSON ThemeSettings { outgoing_message_accent_color = outgoing_message_accent_color, animate_outgoing_message_fill = animate_outgoing_message_fill, outgoing_message_fill = outgoing_message_fill, background = background, accent_color = accent_color } =
  A.object [ "@type" A..= T.String "themeSettings", "outgoing_message_accent_color" A..= outgoing_message_accent_color, "animate_outgoing_message_fill" A..= animate_outgoing_message_fill, "outgoing_message_fill" A..= outgoing_message_fill, "background" A..= background, "accent_color" A..= accent_color ]

instance T.FromJSON ThemeSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "themeSettings" -> parseThemeSettings v
   _ -> mempty
  where
   parseThemeSettings :: A.Value -> T.Parser ThemeSettings
   parseThemeSettings = A.withObject "ThemeSettings" $ \o -> do
    outgoing_message_accent_color <- mconcat [ o A..:? "outgoing_message_accent_color", readMaybe <$> (o A..: "outgoing_message_accent_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    animate_outgoing_message_fill <- o A..:? "animate_outgoing_message_fill"
    outgoing_message_fill <- o A..:? "outgoing_message_fill"
    background <- o A..:? "background"
    accent_color <- mconcat [ o A..:? "accent_color", readMaybe <$> (o A..: "accent_color" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ThemeSettings { outgoing_message_accent_color = outgoing_message_accent_color, animate_outgoing_message_fill = animate_outgoing_message_fill, outgoing_message_fill = outgoing_message_fill, background = background, accent_color = accent_color }
 parseJSON _ = mempty
