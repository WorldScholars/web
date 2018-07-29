{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.Interactive.Scantron (scantron) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)
import Templates.Scripts

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

scantron :: Html
scantron = do
    section ! A.id "signup" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      section ! class_ "form-wrap" $ do
        h1 "Scantron"
        H.form ! A.id "scantronForm" ! A.name "scantronForm" $ do
          mapM_ multiChoice [1..10]
          button ! class_ "btn btn-primary" ! name "button" ! type_ "submit" $ "submit" 


multiChoice :: Int -> Html
multiChoice qNum = do
  H.span $ string $ "Q"++(show qNum)++" :"
  mapM_ oneChoice ["A","B","C","D"]
  br
  br
 where
  oneChoice :: String -> Html
  oneChoice choice = do
    input ! type_ "radio" ! A.id (stringValue choice) ! A.value (stringValue choice) ! A.name (stringValue $ "question_"++(show qNum))
    H.label ! A.for (stringValue choice) $ string choice
