{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.SignUp (signup,verify) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

signup :: Html
signup = do
    section ! A.id "signup" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Sign up for an account on World Scholars"
      section ! class_ "form-wrap" $ do
        h1 "Register"
        H.form ! A.id "registrationForm" $ do
	  input ! type_ "email" ! A.id "emailInputRegister" ! placeholder "Email" ! pattern ".*" ! required ""
	  input ! type_ "password" ! A.id "passwordInputRegister" ! placeholder "Password" ! pattern ".*" ! required ""
	  input ! type_ "password" ! A.id "password2InputRegister" ! placeholder "Confirm Password" ! pattern ".*" ! required ""
	  input ! type_ "submit" ! value "Sign up"
      scripts

verify :: Html
verify = do
    section ! A.id "signup" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Sign up for an account on World Scholars"

      section ! class_ "form-wrap" $ do
        h1 "Verify Email"
        H.form ! A.id "verifyForm" $ do
          input ! type_ "email" ! A.id "emailInputVerify" ! placeholder "Email" ! required ""
          input ! type_ "text" ! A.id "codeInputVerify" ! placeholder "Verification Code" ! pattern ".*" ! required ""
          input ! type_ "submit" ! value "Verify"
      scripts

scripts :: Html
scripts = do
  script ! src "aws_js/vendor/jquery-3.1.0.js" $ mempty
  script ! src "aws_js/vendor/bootstrap.min.js" $ mempty
  script ! src "aws_js/vendor/aws-cognito-sdk.min.js" $ mempty
  script ! src "aws_js/vendor/amazon-cognito-identity.min.js" $ mempty
  script ! src "aws_js/config.js" $ mempty
  script ! src "aws_js/cognito-auth.js" $ mempty
