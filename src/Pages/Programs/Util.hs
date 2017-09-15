{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Pages.Programs.Util where

import Text.Blaze.Html5 hiding (map,head)
import qualified Text.Blaze.Html5 as H hiding (head)
import Text.Blaze.Internal (AttributeValue)
import Data.String
import qualified Data.List as L
import Text.Blaze.Html5.Attributes hiding (name)
import qualified Text.Blaze.Html5.Attributes as A hiding (name)

import Data.List.Split

makeProgramPage :: Program -> Html
makeProgramPage  Program{..} = do
    section ! A.id (fromString $ "about-"++(name)) ! class_ "padding-top wow fadeInUp" ! dataAttribute "wow-duration" "400ms" ! dataAttribute "wow-delay" "400ms" $ H.div ! class_ "container" $ H.div ! class_ "row" $ H.div ! class_ "col-sm-12 text-center" $ do
      img ! src mainPic ! class_ "margin-bottom" ! A.style "width:25%" ! alt ""
      h1 ! class_ "margin-bottom" ! A.style "text-center" $ string $ name
      h2 ! class_ "margin-bottom" ! A.style "text-center" $ string $ dates
      mapM_ ((p ! A.style "text-align:left" ). do toHtml) (lines summary)
      H.div ! class_ "margin-bottom" $ mapM_ renderExtraPic (take 4 captionedPics)
      H.div ! class_ "margin-bottom" $ extraHTML
      
renderExtraPic (pic,c) = do
  H.div ! class_ "col-sm-3 col-xs-10" $ do
     img ! src pic ! alt "" ! A.style "width:95%"
     p $ string c
    
sortWith :: Ord b => (a -> b) -> [a] -> [a]
sortWith f = L.sortBy (\x y -> compare (f x) (f y))

linkTo :: Program -> String
linkTo p =
  (filter (/=' ') $ dates p)++".html"

data Program = Program {
  name :: String,
  location :: String,
  dates :: String,
  epoch :: Int,
  summary :: String,
  mainPic :: AttributeValue,
  captionedPics :: [(AttributeValue,String)],
  extraHTML :: Html
}

