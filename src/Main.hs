module Main where

import Text.Blaze.Html.Renderer.Pretty (renderHtml)
import qualified Text.Blaze.Html5 as H
--import Data.ByteString
import GHC.IO.Encoding

import Pages.Index
import Pages.About
import Pages.People.Everyone

import Template

main :: IO()
main = do
  setLocaleEncoding utf8
  makePage "html/index.html" index
  makePage "html/about.html" about
  writeEveryone

writeEveryone :: IO()  
writeEveryone = 
    mapM_
      (\p -> makePage ("html/"++linkTo p) $ makeBio p)
      everyone 

makePage link p =
  writeFile link $ renderHtml $ embedInTemplate p
