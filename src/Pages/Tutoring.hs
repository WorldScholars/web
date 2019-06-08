{-# LANGUAGE OverloadedStrings #-}

module Pages.Tutoring (tutoringRegistration) where

import Text.Blaze.Html5 hiding (map,head,summary)
import qualified Text.Blaze.Html5 as H hiding (head,summary)
import Text.Blaze.Internal (AttributeValue)
import Data.String
import qualified Data.List as L
import Text.Blaze.Html5.Attributes hiding (name,summary)
import qualified Text.Blaze.Html5.Attributes as A hiding (name,summary)

import Text.Blaze.Html5 (table, td, tr, toHtml, ToMarkup, Html)
import Control.Monad (forM_, mapM_)

import Templates.Blocks 


tutoringRegistration:: String -> Html
tutoringRegistration buttonHTML = do
    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Tutoring"
      p $ do
          "World Scholars is excited to be offering tutoring on a personal referral basis. Please only complete payment below if you have been in contact with us. If you are interested in tutoring please reach out to us at: "
          a ! href "mailto:fiona@worldscholar.global" $ "fiona@worldscholars.global"
          "We offer expertise in English, Math, and Computer Science (including Machine Learning and Blockchain)."
    section ! A.id "payment-options-check" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      H.div ! class_ "col-sm-12 text-center" $ do
        h2 "Payment"
        p "We are currently only aceepting payment via Paypal."
        preEscapedToHtml $ buttonHTML

