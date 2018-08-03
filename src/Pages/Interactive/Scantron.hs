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

spacingStyle = "col-xs-12 col-sm-6 col-md-6 col-lg-3"

scantron :: Html
scantron = do
    section ! A.id "signup" ! class_ "wow fadeInUp" ! dataAttribute "wow-duration" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      h1 ! A.id "testName" $ string $ "SAT Practice Exam #"
    H.form ! A.id "scantronForm" ! A.name "scantronForm" ! class_ "text-center" $ do
      multiChoiceSection "Reading - 65 mins" 1 52
      multiChoiceSection "Writing and Language - 35 mins" 2 44
      multiChoiceSection "Math (No Calculator) - 25 mins" 3 15
      numberInputSection 3 [16..20]
      multiChoiceSection "Math (Calculator) - 55 mins" 4 30
      numberInputSection 4 [31..38]
      button ! class_ "btn btn-primary" ! A.id "scantronFormSubmitButton" ! type_ "submit" ! onsubmit "writeExamData()" $ "submit" 

numberInputSection :: Int -> [Int] -> Html
numberInputSection secNum qNums = do
  H.div ! class_ "container" $ H.div ! class_ "row" $ do
    mapM_ (numberInput secNum) qNums

numberInput :: Int -> Int -> Html
numberInput secNum qNum = do
 H.div ! class_ spacingStyle ! A.style "margin-bottom:10px" $ do
    H.span ! A.style "margin-right:20px" $ string $ show qNum
    input ! type_ "number" 
        ! A.name (stringValue $ "s_"++(show secNum)++"_q_"++(show qNum))
        ! A.value "0.00"
 
multiChoiceSection :: String -> Int -> Int -> Html
multiChoiceSection secName secNum numQs = do 
  section ! A.id "page-breadcrumb" $ H.div ! class_ "vertical-center sun" $ H.div ! class_ "action" $ do
    h1 ! class_ "title" $ string $ "Section "++(show secNum)
    p $ string secName
  H.div ! class_ "row" $ do
    let divNum = numQs `P.div` 4
    mapM_ (multiChoiceGroup secNum)
        [(1,divNum)
        ,(divNum+1,divNum*2)
        ,(divNum*2+1,divNum*3)
        ,(divNum*3+1,numQs)
        ]

multiChoiceGroup :: Int -> (Int, Int) -> Html
multiChoiceGroup secNum (start, end) = 
    H.div ! class_ spacingStyle $ do
      table ! A.class_ "answer-table" $ do
        mapM_ (multiChoice secNum) [start..end]

multiChoice :: Int -> Int -> Html
multiChoice section qNum = do
  tr $ do
    td $ H.span $ string $ show qNum
    mapM_ oneChoice ["A","B","C","D"]
 where
  oneChoice :: String -> Html
  oneChoice choice = td $ do
    H.label ! A.for (stringValue choice) $ string choice
    br
    input ! type_ "radio" ! A.id (stringValue choice) ! A.value (stringValue choice)
        ! A.name (stringValue $ "s_"++(show section)++"_q_"++(show qNum))
