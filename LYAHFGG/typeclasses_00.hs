


data TrafficLight = Red | Yellow | Green


instance Eq TrafficLight where  
    Red == Red = True  
    Green == Green = True  
    Yellow == Yellow = True  
    _ == _ = False  

instance Show TrafficLight where  
    show Red = "Red light"  
    show Yellow = "Yellow light"  
    show Green = "Green light"


stupidFunc :: TrafficLight -> String
stupidFunc x
   | x == Red  = "Redlight"
   | otherwise = "some other color"


