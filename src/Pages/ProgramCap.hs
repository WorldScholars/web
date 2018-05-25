{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.ProgramCap (programcap) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

programcap :: Html
programcap = do

    -- /#page-breadcrumb
    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Our program is fully booked!"
      p $ do
          "Our program is fully booked at the moment, but spots may open up. If you were on the wait list for the program, please reach out on social media or email"
          a ! href "mailto:fiona@worldscholar.global" $ "fiona@worldscholars.global"
          ". It is possible there are still spots available."
