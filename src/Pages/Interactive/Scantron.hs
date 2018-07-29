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
        H.form ! A.id "scantronForm" ! customAttribute "data-persist" "garlic" $ do
          mapM_ multiChoice [1..10]
      awsScripts

multiChoice :: Int -> Html
multiChoice qNum = do
  H.span $ string $ "Q"++(show qNum)++" :"
  mapM_ oneChoice ["A","B","C","D"]
  br
 where
  oneChoice :: String -> Html
  oneChoice choice = do
    H.div! class_ "pretty p-default p-fill p-round p-pulse" $ do
      input ! type_ "radio" ! A.name (stringValue $ "question_"++(show qNum))
      H.div ! class_ "state" $ do
        H.label $ string choice
