{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.ThankYou (thankyou) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

thankyou:: Html
thankyou = do
    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Thank you for applying"
      p $ do
          "Thank you for registering for SAT+2018. If you have any questions, please reach out over WeChat or email us at "
          a ! href "mailto:fiona@worldscholar.global" $ "fiona@worldscholars.global"
          ". We will reach out with further details in July."
