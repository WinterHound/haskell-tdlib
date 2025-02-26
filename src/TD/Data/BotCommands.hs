{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.BotCommands where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BotCommand as BotCommand
import qualified Utils as U

-- |
data BotCommands = -- | Contains a list of bot commands @bot_user_id Bot's user identifier @commands List of bot commands
  BotCommands
  { -- |
    commands :: Maybe [BotCommand.BotCommand],
    -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show BotCommands where
  show
    BotCommands
      { commands = commands_,
        bot_user_id = bot_user_id_
      } =
      "BotCommands"
        ++ U.cc
          [ U.p "commands" commands_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.FromJSON BotCommands where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "botCommands" -> parseBotCommands v
      _ -> mempty
    where
      parseBotCommands :: A.Value -> T.Parser BotCommands
      parseBotCommands = A.withObject "BotCommands" $ \o -> do
        commands_ <- o A..:? "commands"
        bot_user_id_ <- o A..:? "bot_user_id"
        return $ BotCommands {commands = commands_, bot_user_id = bot_user_id_}
  parseJSON _ = mempty

instance T.ToJSON BotCommands where
  toJSON
    BotCommands
      { commands = commands_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "botCommands",
          "commands" A..= commands_,
          "bot_user_id" A..= bot_user_id_
        ]
