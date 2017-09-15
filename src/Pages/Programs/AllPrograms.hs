{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Pages.Programs.AllPrograms (allPrograms) where

import Text.Blaze.Html5 hiding (map,head)
import qualified Text.Blaze.Html5 as H hiding (head)
import Text.Blaze.Internal (AttributeValue)
import Data.String
import qualified Data.List as L
import Text.Blaze.Html5.Attributes hiding (name)
import qualified Text.Blaze.Html5.Attributes as A hiding (name)


import Pages.Programs.Util
import Pages.Programs.Feb2018


allPrograms :: [Program]
allPrograms = sortWith epoch
  [
   may2016
  ,feb2017
  ,aug2017
  ,feb2018
  ]

may2016 = Program{
  name = "World Scholars in Korea"
 ,location = "Nonsan, South Korea"
 ,dates = "May 2016"
 ,epoch = 1462111307
 ,summary = "This week long series hosted at Guemgang University brought 9 World Scholars to campus for lectures and one-on-one sessions."
 ,mainPic = "images/home/IMG_0009.JPG"
 ,captionedPics = replicate 4  (("images/home/IMG_0009.JPG":: AttributeValue,"Caption goes here"))
 ,extraHTML = do
    h1 "" 
}

feb2017 = Program{
  name = "Young Undergraduates Overseas Immersion Program"
 ,location = "New Haven, CT"
 ,dates = "Feb 2017"
 ,epoch = 1485957707
 ,summary = "There were 300 applicants for 15 spots for this 10 day program. The overall aim of the program is to create a greater awareness in the minds of the delegation to understand the philosophy and the practice of education outside China, and to learn new skills in the area of liberal arts, which are not emphasized in their current degree program."
 ,mainPic = "images/home/IMG_0009.JPG"
 ,captionedPics = []
 ,extraHTML = h1 ""
}

aug2017 = Program{
  name = "SAT+"
 ,location = "Woodbridge, CT"
 ,dates = "Aug 2017"
 ,epoch = 1501596107
 ,summary = 
   "This month long program comibined SAT prep with passion projects.\n"++
   "What is a Passion Project? In America and around the globe, educators are moving away from test-centric summative evaluations for learning. The educational landscape is moving towards a formative assessment in which students are expressing their learning in a more comprehensive way through projects. Project-based learning is the inspiration behind Passion Projects. We value the multi-dimensional ways of expressing learning through topics that students care about and we want to make sure that we provide an opportunity for students to make that happen. The Passion Projects will allow students to collaborate, innovate, and design a project (whether it be an idea or a product) of their choosing and we will facilitate to see through the project's completion.\n"++
"By participating in the World Scholars program, students will develop the skills to present themselves, not just as strong students, but as future leaders. The final project gives students the first push to take charge of their own education and find passion in their work. Not all students will continue to work on their passion project after the program, but all students will use those skills to find the next passion project to work on.\n"++
"To participate in the next SAT+ program and start your own passion project, email us at fiona@worldscholars.global"
--"To participate in the next SAT+ program and start your own passion project, email us at <a href=\"mailto:fiona@worldscholars.global\">fiona@worldscholars.global</a>"
            --a ! href "mailto:fiona@worldscholars.global" $ "fiona@worldscholars.global"
 ,mainPic = "images/home/class.jpg"
 ,captionedPics = []
 ,extraHTML = h1 ""
}

