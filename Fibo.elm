module Fibo exposing (..)
import Browser
import Html exposing (text, br, button, div, h2, input, p)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }

init : Model
init =
  2

type alias Model = Int

type Msg = Increment | Decrement

isEven x= modBy 2 x==0

addtolist x flist =
      if x>1 then
          let 
              newlist=fib x::flist
          in
              addtolist (x-1) newlist
      else
        --flist
        
        List.sum (List.filter isEven flist)

fib x = 
    case x of 
      0 -> 1 
      1 -> 1
      _ -> 
          fib (x-1)+fib (x-2)

view model = 

    div [] [
      h2 [] [text "Fibonnaci"],
      br [] [],
      button [onClick Increment] [text "+"],
      br [] [],
      text (Debug.toString (model)),
      br [] [],
      button [onClick Decrement] [text "-"],
      p [] [
        text ("Sum of even Fibonacci Number in series is: "++ Debug.toString(addtolist model []) )
      ]
    ]

update msg model =
  case msg of
    Increment ->
     if model>=100 then 100
     else  model + 1

    Decrement -> 
      if model == 2 then model 
      else model - 1
