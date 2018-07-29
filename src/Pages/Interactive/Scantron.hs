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
      h1 ! class_ "margin-bottom" $ "Sign up for an account on World Scholars"
      section ! class_ "form-wrap" $ do
        h1 "Register"
        H.form ! A.id "registrationForm" $ do
          input ! type_ "email" ! A.id "emailInputRegister" ! placeholder "Email" ! pattern ".*" ! required ""
          input ! type_ "password" ! A.id "passwordInputRegister" ! placeholder "Password" ! pattern ".*" ! required ""
          input ! type_ "password" ! A.id "password2InputRegister" ! placeholder "Confirm Password" ! pattern ".*" ! required ""
          input ! type_ "submit" ! value "Sign up"
      awsScripts

multiChoice :: Int -> Html
multiChoice qNum = do
  H.div! class_ "pretty p-fill p-round p-pulse" $ do
    mapM_ oneChoice ["A","B","C","D"]
 where
  oneChoice :: String -> Html
  oneChoice choice = do
    input ! type_ "radio" ! A.name (stringValue $ "question_"++(show qNum))
    H.div ! class_ "state" $ do
      H.label $ string choice
