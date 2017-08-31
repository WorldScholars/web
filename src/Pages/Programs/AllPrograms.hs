{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Pages.Programs.AllPrograms where

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
      p $ do toHtml summary
    

allPrograms :: [Program]
allPrograms = sortWith epoch
  [
   may2016
  ,feb2017
  ,aug2017
  ,feb2018
  ]


linkTo :: Program -> String
linkTo p =
  (filter (/=' ') $ dates p)++".html"

data Program = Program {
  name :: String,
  location :: String,
  dates :: String,
  epoch :: Int,
  summary :: String,
  mainPic :: AttributeValue
}

may2016 = Program{
  name = "World Scholars in Korea"
 ,location = "Nonsan, South Korea"
 ,dates = "May 2016"
 ,epoch = 1462111307
 ,summary = "This week long series hosted at Guemgang University brought 9 World Scholars to campus for lectures and one-on-one sessions."
 ,mainPic = ""
}

feb2017 = Program{
  name = "???"
 ,location = "New Haven, CT"
 ,dates = "Feb 2017"
 ,epoch = 1485957707
 ,summary = "This 10 day program was run in partnership with GYDO"
 ,mainPic = ""
}

aug2017 = Program{
  name = "SAT+"
 ,location = "Woodbridge, CT"
 ,dates = "Aug 2017"
 ,epoch = 1501596107
 ,summary = "This month long program comibined SAT prep with passion projects"
 ,mainPic = ""
}

feb2018 = Program{
  name = "International Symposium"
 ,location = "New Haven, CT"
 ,dates = "Feb 2018"
 ,epoch = 1517493707
 ,summary = "This 10 day program will..."
 ,mainPic = ""
}
sortWith :: Ord b => (a -> b) -> [a] -> [a]
sortWith f = L.sortBy (\x y -> compare (f x) (f y))
