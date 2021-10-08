-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetCommands where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.BotCommand as BotCommand
import {-# SOURCE #-} qualified API.BotCommandScope as BotCommandScope

-- |
-- 
-- Sets the list of commands supported by the bot for the given user scope and language; for bots only
-- 
-- __scope__ The scope to which the commands are relevant; pass null to change commands in the default bot command scope
-- 
-- __language_code__ A two-letter ISO 639-1 country code. If empty, the commands will be applied to all users from the given scope, for which language there are no dedicated commands
-- 
-- __commands__ List of the bot's commands
data SetCommands = 

 SetCommands { commands :: Maybe [BotCommand.BotCommand], language_code :: Maybe String, scope :: Maybe BotCommandScope.BotCommandScope }  deriving (Eq)

instance Show SetCommands where
 show SetCommands { commands=commands, language_code=language_code, scope=scope } =
  "SetCommands" ++ cc [p "commands" commands, p "language_code" language_code, p "scope" scope ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetCommands where
 toJSON SetCommands { commands = commands, language_code = language_code, scope = scope } =
  A.object [ "@type" A..= T.String "setCommands", "commands" A..= commands, "language_code" A..= language_code, "scope" A..= scope ]

instance T.FromJSON SetCommands where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setCommands" -> parseSetCommands v
   _ -> mempty
  where
   parseSetCommands :: A.Value -> T.Parser SetCommands
   parseSetCommands = A.withObject "SetCommands" $ \o -> do
    commands <- o A..:? "commands"
    language_code <- o A..:? "language_code"
    scope <- o A..:? "scope"
    return $ SetCommands { commands = commands, language_code = language_code, scope = scope }
 parseJSON _ = mempty
