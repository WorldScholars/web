module Main where

import Text.Blaze.Html.Renderer.Pretty (renderHtml)
import qualified Text.Blaze.Html5 as H
--import Data.ByteString
import GHC.IO.Encoding

import Pages.Index
import Pages.ThankYou
import Pages.ProgramCap

import Pages.Apply
import Pages.About
import Pages.FAQ
import Pages.People
import qualified Pages.People.Everyone as E
import Pages.Programs
import qualified Pages.Programs.AllPrograms as P
import qualified Pages.Programs.SATPlus2018 as SAT2018
import qualified Pages.Programs.Util as P

--User stuff
import Pages.SignUp

import Template

main :: IO()
main = do
  setLocaleEncoding utf8
  makePage "html/index.html" index
  makePage "html/about.html" about
  makePage "html/apply.html" apply
  makePage "html/programs.html" programs
  makePage "html/faq.html" faq
  writeEveryone
  writePrograms
  
  --makePage "html/programcap.html" programcap
  makePage "html/thankyou.html" thankyou

  paypalButton <- readFile "src/paypalButton.html"
  makePage "html/registration.html" $ SAT2018.registration paypalButton

  makePage "html/signup.html" signup
  makePage "html/verify.html" verify

writeEveryone :: IO()  
writeEveryone = 
    mapM_
      (\p -> makePage ("html/"++E.linkTo p) $ E.makeBio p)
      E.everyone 

writePrograms :: IO()  
writePrograms  = 
    mapM_
      (\p -> makePage ("html/"++P.linkTo p) $ P.makeProgramPage p)
      P.allPrograms 

makePage link p =
  writeFile link $ renderHtml $ embedInTemplate p
