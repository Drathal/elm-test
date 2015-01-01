module Test where

import ElmTest.Assertion (..)
import ElmTest.Test (..)

import List

-- Example Usage
----------------
tests : List Test
tests = [ (\_ -> (2^3)) `equals` (\_ -> 1)
        , (\_ -> 3) `equals` (\_ -> 3)
        , exceptionTest
        , defaultTest (assertNotEqual (\_ -> False) (\_ -> True))
        , defaultTest <| assertEqual (\_ -> 1) (\_ -> List.head [])
        , test "test head" (assertEqual (\_ -> 1) (\_ -> (List.head [1..10])))
        ]

tests2 : List Test
tests2 = [ (\_ -> (2^3)) `equals` (\_ -> 8)
         , (\_ -> 3) `equals` (\_ -> 3)
         , defaultTest (assertEqual (\_ -> True) (\_ -> True))
         , test "test head" (assertEqual (\_ -> 1) (\_ -> (List.head [1..10])))
         ]

passingTest : Test
passingTest = test "passing test" <| assertEqual (\_ -> 0) (\_ -> 0)

failingTest : Test
failingTest = test "failing test" <| assertEqual (\_ -> 1) (\_ -> 0)

exceptionTest : Test
exceptionTest = test "exceptionTest" <| assertEqual (\_ -> 1) (\_ -> List.head [])

suite = Suite "Some tests" tests2
suite2 = Suite "A Test Suite" [suite, Suite "Some other tests" tests2, Suite "More tests!" tests2, (\_ -> 3) `equals` (\_ -> 3), Suite "Even more!!" tests2]
suite3 = Suite "A Test Suite" [suite, Suite "Some other tests" tests, Suite "More tests!" tests2, (\_ -> 3) `equals` (\_ -> 3), Suite "Even more!!" tests2]
