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
      h2 ! class_ "margin-bottom" ! A.style "text-center" $ string $ dates
      mapM_ ((p ! A.style "text-align:left" ). do toHtml) (lines summary)
      H.div ! class_ "margin-bottom" $ mapM_ renderExtraPic (take 4 captionedPics)
      
renderExtraPic (pic,c) = do
  H.div ! class_ "col-sm-3 col-xs-10" $ do
     img ! src pic ! alt "" ! A.style "width:95%"
     p $ string c
    

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
  mainPic :: AttributeValue,
  captionedPics :: [(AttributeValue,String)]
}

may2016 = Program{
  name = "World Scholars in Korea"
 ,location = "Nonsan, South Korea"
 ,dates = "May 2016"
 ,epoch = 1462111307
 ,summary = "This week long series hosted at Guemgang University brought 9 World Scholars to campus for lectures and one-on-one sessions."
 ,mainPic = "images/home/IMG_0009.JPG"
 ,captionedPics = replicate 4  (("images/home/IMG_0009.JPG":: AttributeValue,"Caption goes here"))
}

feb2017 = Program{
  name = "New Haven Winter '17"
 ,location = "New Haven, CT"
 ,dates = "Feb 2017"
 ,epoch = 1485957707
 ,summary = "This 10 day program was run in partnership with GYDO. There were 300 applicants for 15 spots."
 ,mainPic = "images/home/IMG_0009.JPG"
 ,captionedPics = []
}

aug2017 = Program{
  name = "SAT+"
 ,location = "Woodbridge, CT"
 ,dates = "Aug 2017"
 ,epoch = 1501596107
 ,summary = 
   "This month long program comibined SAT prep with passion projects.\n"++
   "What is a Passion Project? In America and around the globe, educators are moving away from test-centric summative evaluations for learning. The educational landscape is moving towards a formative assessment in which students are expressing their learning in a more comprehensive way through projects. Project-based learning is the inspiration behind Passion Projects. We value the multi-dimensional ways of expressing learning through topics that students care about and we want to make sure that we provide an opportunity for students to make that happen. The Passion Projects will allow students to collaborate, innovate, and design a project (whether it be an idea or a product) of their choosing and we will facilitate to see through the project's completion.\n"++
"By participating in the World Scholars program, students will develop the skills to present themselves, not just as strong students, but as future leaders. The final project gives students the first push to take charge of their own education and find passion in their work. Not all students will continue to work on their passion project after the program, but all students will use those skills to find the next passion project to work on."

 ,mainPic = "images/home/IMG_0009.JPG"
 ,captionedPics = []
}

feb2018 = Program{
  name = "Intercultural Exchange through the lens of Liberal Arts"
 ,location = "New Haven, CT"
 ,dates = "Feb 2018"
 ,epoch = 1517493707
 ,summary = "This two week (2018/1/28 - 2018/2/12) program will bring together students from 5 countries, and a broad spectrum of socio-economic backgrounds to provide a multicultural, diverse and unique educational experience. "
 ,mainPic = "images/home/IMG_0009.JPG"
 ,captionedPics = []
}


sortWith :: Ord b => (a -> b) -> [a] -> [a]
sortWith f = L.sortBy (\x y -> compare (f x) (f y))
