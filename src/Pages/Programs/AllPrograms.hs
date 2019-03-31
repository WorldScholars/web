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
import Pages.Programs.SATPlus2018
import Pages.Programs.SATPlus2019


allPrograms :: [Program]
allPrograms = sortWith epoch
  [
   may2016
  ,feb2017
  ,aug2017
  ,feb2018
  ,sat2018
--  ,sat2019
  ]

may2016 = Program{
  name = "World Scholars in Korea"
 ,location = "Nonsan, South Korea"
 ,dates = "May 2016"
 ,pageName = Nothing
 ,epoch = 1462111307
 ,summary = do
    p "This week long series hosted at Guemgang University brought 9 World Scholars to campus for lectures and one-on-one sessions. Each World Scholar presented a lecture/workshop on the particular field of interest. Each lecture included Korean language translation support so that every student benefited from the experience, no matter their prior experience."
 ,mainPic = "images/home/IMG_0009.JPG"
 ,captionedPics = [
   ("images/programs/ggu1.jpg":: AttributeValue,"Students working on group projects in the GGU library."),
   ("images/programs/ggu2.jpg":: AttributeValue,"Dr. Maria Hwang working with students on innovation."),
   ("images/programs/ggu3.jpg":: AttributeValue,"Learning computer science."),
   ("images/programs/ggu4.jpg":: AttributeValue,"Rahel Kroeker works with students in small groups")]
 ,extraHTML = do
    h1 "" 
}

feb2017 = Program{
  name = "Young Undergraduates Overseas Immersion Program"
 ,location = "New Haven, CT"
 ,dates = "Feb 2017"
 ,pageName = Nothing
 ,epoch = 1485957707
 ,summary = do
    p "There were 300 applicants for 15 spots for this 10 day program. The overall aim of the program is to create a greater awareness in the minds of the delegation to understand the philosophy and the practice of education outside China, and to learn new skills in the area of liberal arts, which are not emphasized in their current degree program."
 ,mainPic = "images/home/dinner.jpg"
 ,captionedPics = [
   ("images/programs/feb2017/aaronClass.jpg":: AttributeValue,"Aaron Profumo works with students on understanding theater."),
   ("images/programs/feb2017/natHist.jpg":: AttributeValue,"Students take guided tour of the Peabody Natural History Museum."),
   ("images/programs/feb2017/jacobClass.jpg":: AttributeValue,"Jacob Li gives a lecture on philosophy."),
   ("images/programs/feb2017/musicClass.jpg":: AttributeValue,"A music lecture gives students a first hand look into the piece they will hear later that night.")]
 ,extraHTML = h1 ""
}

aug2017 = Program{
  name = "SAT+ 2017"
 ,location = "Woodbridge, CT"
 ,dates = "Aug 2017"
 ,pageName = Nothing
 ,epoch = 1501596107
 ,summary = do
    p "This month long program combined SAT prep with passion projects. Designed for student grades 7-12, the program helped students not only prepare for college entrance exams, but also for long-term success after they arrive at college." 
 ,mainPic = "images/home/class.jpg"
 ,captionedPics = []
 ,extraHTML = do
   p "What is a Passion Project? In America and around the globe, educators are moving away from test-centric summative evaluations for learning. The educational landscape is moving towards a formative assessment in which students are expressing their learning in a more comprehensive way through projects. Project-based learning is the inspiration behind Passion Projects. We value the multi-dimensional ways of expressing learning through topics that students care about and we want to make sure that we provide an opportunity for students to make that happen. The Passion Projects will allow students to collaborate, innovate, and design a project (whether it be an idea or a product) of their choosing and we will facilitate to see through the project's completion."
   p "By participating in the SAT+ World Scholars program, students developed the skills to present themselves, not just as strong students, but as future leaders. The final passion project gives students the first push to take charge of their own education and find passion in their work. Not all students will continue to work on their passion project after the program, but all students will use those skills to find the next passion project to work on."
   br
   p "To participate in the next SAT+ program and start your own passion project, email us at "
   a ! href "mailto:fiona@worldscholars.global" $ "fiona@worldscholars.global"
}

