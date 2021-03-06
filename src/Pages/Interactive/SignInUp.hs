{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
module Pages.Interactive.SignInUp (signup,verify,signin) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)
import Templates.Scripts

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
        p "Your password be at least 8 characters long and must have at least one of each:"
        ul $ do
          li "number"
          li "special character"
          li "uppercase letter"
          li "lowercase letter"
        H.form ! A.id "registrationForm" $ do
          input ! type_ "email" ! A.id "emailInputRegister" ! placeholder "Email" ! pattern ".*" ! required ""
          input ! type_ "password" ! A.id "passwordInputRegister" ! placeholder "Password" ! pattern ".*" ! required ""
          input ! type_ "password" ! A.id "password2InputRegister" ! placeholder "Confirm Password" ! pattern ".*" ! required ""
          input ! type_ "submit" ! value "Sign up"

signin :: Html
signin = do
    section ! A.id "signin" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      section ! class_ "form-wrap" $ do
        h1 "Sign in"
        H.form ! A.id "signinForm" $ do
          input ! type_ "email" ! A.id "emailInputSignin" ! placeholder "Email" ! required ""
          input ! type_ "password" ! A.id "passwordInputSignin" ! placeholder "Password" ! pattern ".*" ! required ""
          input ! type_ "submit" ! value "Sign In"
        h1 "Or, if you do not yet have an account:"
        h2 $ do
           a ! href "signup.html" $ "Sign up"
           "for a new account."


verify :: Html
verify = do
    section ! A.id "verify" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      section ! class_ "form-wrap" $ do
        h1 "Verify Email"
        H.form ! A.id "verifyForm" $ do
          input ! type_ "email" ! A.id "emailInputVerify" ! placeholder "Email" ! required ""
          input ! type_ "text" ! A.id "codeInputVerify" ! placeholder "Verification Code" ! pattern ".*" ! required ""
          input ! type_ "submit" ! value "Verify"

