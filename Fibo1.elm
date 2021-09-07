module Fibo1 exposing (..)
import Browser
import Html exposing (div,input,text,h1,br,p)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main =
    Browser.sandbox {init=init,update=update,view=view}

type alias Model=
    {
        inputc: String
    }

type Msg =
    Inputc String
init = Model ""


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

fib : Int->Int
fib x =         -- This will produce the fibonacci series
    case x of 
      0 -> 1 
      1 -> 1
      _ -> 
          fib (x-1)+fib (x-2)

view model =
    div [] 
    [
        text "enter"
        , input [type_ "number", placeholder "Please enter only number", onInput Inputc ][]
        , br [][]
        ,  text "Check if the content is int : "
        , p [] 
            [
                text ("Sum of even Fibonacci Number in series is: "++ 
                Debug.toString(addtolist (Maybe.withDefault 0 (String.toInt model.inputc)) []) )
            ]
    ]



update msg model=
    case msg of 
        Inputc inputc-> 
            { model | inputc= inputc}
