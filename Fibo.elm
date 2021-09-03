module Fibo exposing (..)
import Browser
import Html exposing (text, br, button, div, h2, input, p)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onInput,onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }

init : Model
init =
  2

evensum=0

type alias Model = Int

type Msg = Increment | Decrement

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
      text ("Fibonacci Number is "++ Debug.toString(fib model) )
    ]
  ]

fib x = 
  case x of 
    0 -> 1 
    1 -> 1
    _ -> 
        fib (x-1)+fib (x-2)
     

update msg model =
  case msg of
    Increment ->
     if model>=100 then 100
     else  model + 1

    Decrement -> 
      if model == 2 then model 
      else model - 1
