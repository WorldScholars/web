{-# LANGUAGE OverloadedStrings #-}

module Pages.Programs.SATPlus2018 (sat2018) where

import Text.Blaze.Html5 hiding (map,head,summary)
import qualified Text.Blaze.Html5 as H hiding (head,summary)
import Text.Blaze.Internal (AttributeValue)
import Data.String
import qualified Data.List as L
import Text.Blaze.Html5.Attributes hiding (name,summary)
import qualified Text.Blaze.Html5.Attributes as A hiding (name,summary)

import Text.Blaze.Html5 (table, td, tr, toHtml, ToMarkup, Html)
import Control.Monad (forM_, mapM_)

import Templates.Blocks 

import Pages.Programs.Util


sat2018 = Program{
  name = "SAT+ 2018"
 ,location = "Greater New Haven Area (Exact Location TBA), CT"
 ,dates = "Aug 2018"
 ,epoch = 1534529026 
 ,summary = do
   p "This year World Scholars will bring its SAT+ program back to the community, condensed into a two week program from August 6-17. This intensive SAT prep program goes beyond just preparing students for standardized testing, but helps hone their academic and interpersonal skills to prepare them for the college admissions process."
 ,mainPic = "images/home/class.jpg"
 ,captionedPics = []
 ,extraHTML = do
   p "Students may choose to register for either week or both weeks."
   --myTable ([["August 6th - 10th",a ! href "/register.html" $ "Register Now"]
   --         ,["August 13th - 17th",a ! href "/register.html" $ "Register Now"]]::[[Html]])
   myTable ([["August 6th - 10th", "Registration coming soon"]
            ,["August 13th - 17th", "Registration coming soon"]]::[[Html]])
   p "The program will run from 9:00 AM to 4:30 PM, Monday through Friday. Below is an outline of a student’s typical day."
   myTable ([["8:55 AM", "Students dropped off"]
            ,["9:00 AM", "SAT English lecture"]
            ,["10:00 AM", "SAT English practice problems"]
            ,["11:00 AM", "SAT English writing workshop"]
            ,["12:00 PM", "Lunch"]
            ,["12:30 PM", "SAT Math Lecture"]
            ,["1:30 PM", "SAT Math practice problems"]
            ,["2:30 PM", "Passion Project"]
            ,["4:30 PM", "Students picked up"]] :: [[String]])
   p "What is a Passion Project? In America and around the globe, educators are moving away from test-centric summative evaluations for learning. The educational landscape is moving towards a formative assessment in which students are expressing their learning in a more comprehensive way through projects. Project-based learning is the inspiration behind Passion Projects. We value the multi-dimensional ways of expressing learning through topics that students care about and we want to make sure that we provide an opportunity for students to make that happen. The Passion Projects will allow students to collaborate, innovate, and design a project (whether it be an idea or a product) of their choosing and we will facilitate to see through the project's completion.  Guest lecturers will come on Tuesdays and Thursdays to expose students to potential academic and professional career paths as well as inspire Passion Project work."
   p "By participating in the World Scholars program, students will develop the skills to present themselves, not just as strong students, but as future leaders. The final project gives students the first push to take charge of their own education and find passion in their work. Not all students will continue to work on their Passion Project after the program, but all students will use those skills to find the next Passion Project to work on."
   p "To participate in the next SAT+ program and start your own Passion Project, stay tuned for registration instructions. The enrollment for this program is capped at 20 students per week and positions in our program are awarded on a first come, first serve basis."
   p "Price and location TBA"
   a ! href "mailto:fiona@worldscholars.global" $ "fiona@worldscholars.global"
}


myTable :: (ToMarkup a) => [[a]] -> Html
myTable xs = table ! A.class_ "price-table" $ forM_ xs (tr . mapM_ (td . toHtml))
    
