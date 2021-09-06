module Fibo exposing (..)
import Browser
import Html exposing (text, br, button, div, h2, input, p)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }

init : Model
init =
  2   -- This is to initialize the value to the model

type alias Model = Int

type Msg = Increment | Decrement

isEven x= modBy 2 x==0  -- This is to check if the value is even or not

addtolist x flist =                     -- This is a recursive function which will give the output
      if x>1 then
          let 
              newlist=fib x::flist      -- This will add the content to a list
          in
              addtolist (x-1) newlist   -- This will call back the function again
      else
        --flist
        
        List.sum (List.filter isEven flist)   -- This will first filter the even numbers and then take a sum of the same

fib x =         -- This will produce the fibonacci series
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
     if model>=100 then 100 -- Giving limit to the model max is 100
     else  model + 1

    Decrement -> 
      if model == 2 then model 
      else model - 1
