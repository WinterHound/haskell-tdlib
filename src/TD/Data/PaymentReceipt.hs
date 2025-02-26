{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PaymentReceipt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.Photo as Photo
import qualified TD.Data.ShippingOption as ShippingOption
import qualified Utils as U

-- |
data PaymentReceipt = -- | Contains information about a successful payment
  PaymentReceipt
  { -- | The amount of tip chosen by the buyer in the smallest units of the currency
    tip_amount :: Maybe Int,
    -- | Title of the saved credentials chosen by the buyer
    credentials_title :: Maybe String,
    -- | Chosen shipping option; may be null
    shipping_option :: Maybe ShippingOption.ShippingOption,
    -- | Order information; may be null
    order_info :: Maybe OrderInfo.OrderInfo,
    -- | Information about the invoice
    invoice :: Maybe Invoice.Invoice,
    -- | User identifier of the payment provider bot
    payment_provider_user_id :: Maybe Int,
    -- | User identifier of the seller bot
    seller_bot_user_id :: Maybe Int,
    -- | Point in time (Unix timestamp) when the payment was made
    date :: Maybe Int,
    -- | Product photo; may be null
    photo :: Maybe Photo.Photo,
    -- |
    description :: Maybe FormattedText.FormattedText,
    -- | Product title
    title :: Maybe String
  }
  deriving (Eq)

instance Show PaymentReceipt where
  show
    PaymentReceipt
      { tip_amount = tip_amount_,
        credentials_title = credentials_title_,
        shipping_option = shipping_option_,
        order_info = order_info_,
        invoice = invoice_,
        payment_provider_user_id = payment_provider_user_id_,
        seller_bot_user_id = seller_bot_user_id_,
        date = date_,
        photo = photo_,
        description = description_,
        title = title_
      } =
      "PaymentReceipt"
        ++ U.cc
          [ U.p "tip_amount" tip_amount_,
            U.p "credentials_title" credentials_title_,
            U.p "shipping_option" shipping_option_,
            U.p "order_info" order_info_,
            U.p "invoice" invoice_,
            U.p "payment_provider_user_id" payment_provider_user_id_,
            U.p "seller_bot_user_id" seller_bot_user_id_,
            U.p "date" date_,
            U.p "photo" photo_,
            U.p "description" description_,
            U.p "title" title_
          ]

instance T.FromJSON PaymentReceipt where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "paymentReceipt" -> parsePaymentReceipt v
      _ -> mempty
    where
      parsePaymentReceipt :: A.Value -> T.Parser PaymentReceipt
      parsePaymentReceipt = A.withObject "PaymentReceipt" $ \o -> do
        tip_amount_ <- o A..:? "tip_amount"
        credentials_title_ <- o A..:? "credentials_title"
        shipping_option_ <- o A..:? "shipping_option"
        order_info_ <- o A..:? "order_info"
        invoice_ <- o A..:? "invoice"
        payment_provider_user_id_ <- o A..:? "payment_provider_user_id"
        seller_bot_user_id_ <- o A..:? "seller_bot_user_id"
        date_ <- o A..:? "date"
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        return $ PaymentReceipt {tip_amount = tip_amount_, credentials_title = credentials_title_, shipping_option = shipping_option_, order_info = order_info_, invoice = invoice_, payment_provider_user_id = payment_provider_user_id_, seller_bot_user_id = seller_bot_user_id_, date = date_, photo = photo_, description = description_, title = title_}
  parseJSON _ = mempty

instance T.ToJSON PaymentReceipt where
  toJSON
    PaymentReceipt
      { tip_amount = tip_amount_,
        credentials_title = credentials_title_,
        shipping_option = shipping_option_,
        order_info = order_info_,
        invoice = invoice_,
        payment_provider_user_id = payment_provider_user_id_,
        seller_bot_user_id = seller_bot_user_id_,
        date = date_,
        photo = photo_,
        description = description_,
        title = title_
      } =
      A.object
        [ "@type" A..= T.String "paymentReceipt",
          "tip_amount" A..= tip_amount_,
          "credentials_title" A..= credentials_title_,
          "shipping_option" A..= shipping_option_,
          "order_info" A..= order_info_,
          "invoice" A..= invoice_,
          "payment_provider_user_id" A..= payment_provider_user_id_,
          "seller_bot_user_id" A..= seller_bot_user_id_,
          "date" A..= date_,
          "photo" A..= photo_,
          "description" A..= description_,
          "title" A..= title_
        ]
