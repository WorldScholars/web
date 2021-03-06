{-# LANGUAGE OverloadedStrings #-}

module Pages.Lau (lau) where

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


lau :: String -> Html
lau buttonHTML = do
    section ! A.id "about-company" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Payment correction"
      p $ "Hi Mr. Lau, sorry for the technical trouble, please click this link to complete payment."
    section ! A.id "payment-options-check" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      H.div ! class_ "col-sm-12 text-center" $ do
        h2 "Payment"
        preEscapedToHtml $ buttonHTML

