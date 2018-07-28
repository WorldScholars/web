{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.SignUp (signup) where

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

    -- /#page-breadcrumb
    section ! A.id "signup" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! class_ "margin-bottom" $ "Sign up for an account on World Scholars"
      section ! class_ "form-wrap" $ do
	h1 "Register"
	H.form ! A.id "registrationForm" $ do
	  input ! type_ "email" ! A.id "emailInputRegister" ! placeholder "Email" ! pattern ".*" ! required ""
	  input ! type_ "password" ! A.id "passwordInputRegister" ! placeholder "Password" ! pattern ".*" ! required ""
	  input ! type_ "password" ! A.id "password2InputRegister" ! placeholder "Confirm Password" ! pattern ".*" ! required ""
	  input ! type_ "submit" ! value "Sign up"

        script ! src "js/vendor/jquery-3.1.0.js" $ mempty
        script ! src "js/vendor/bootstrap.min.js" $ mempty
        script ! src "js/vendor/aws-cognito-sdk.min.js" $ mempty
        script ! src "js/vendor/amazon-cognito-identity.min.js" $ mempty
        script ! src "js/config.js" $ mempty
        script ! src "js/cognito-auth.js" $ mempty
