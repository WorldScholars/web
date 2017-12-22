{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PartialTypeSignatures #-}
module Pages.FAQ (faq) where

import Prelude
import qualified Prelude as P
import Data.Monoid (mempty)
import Control.Monad

import Text.Blaze
import Text.Blaze.Html5
import qualified Text.Blaze.Html5 as H
import Text.Blaze.Html5.Attributes
import qualified Text.Blaze.Html5.Attributes as A

import Pages.People.Everyone

faq :: Html
faq = do

    -- /#company-information
    section ! A.id "team" $ H.div ! class_ "container" $ H.div ! class_ "row" $ do
      h1 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ "FAQ"
      mapM_ makeLink allFAQs
      mapM_ makeQuestions allFAQs

makeLink (title,anch,_) = li $ a ! href anch $ title

makeQuestions (title,_,content) = do
    h2 ! class_ "title text-center wow fadeInDown" ! dataAttribute "wow-duration" "500ms" ! dataAttribute "wow-delay" "300ms" $ title
    p ! class_ "wow fadeInDown" ! A.style "padding-left:12%;padding-right:12%" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "0ms" $ do content

allFAQs = [howtoapply,scholarship]

scholarship =
   ("Is scholarship available?", "#scholarship", "The best place to start looking for funding is through your home institution. Additionally, World Scholars has some scholarship available on a need-based evaluation for each student. In order to apply for scholarship, please indicate you are interesting scholarship in your application. World Scholars is dedicated to making all our programs available to as many students as possible and will work one-on-one with each student to assist them as much as we are able to find funding.")

howtoapply :: (_, _, Html)
howtoapply = 
   ("How to apply", "#applying", "Apply with the form")

    
