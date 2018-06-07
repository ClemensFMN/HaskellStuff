

-- appearently, "everything" can be used for data (Monday is nowhere defined)
-- Show is required for meaningful printing
-- we can additionally derive from Eq as for equality check (without,
-- stupidFunc won't work...)
data Day = Monday | Tuesday | Wednesday | Thursday | Friday deriving(Show)

-- or we define how the instance of the Eq typeclass shall behave...
instance Eq Day where
	Monday == Monday = True
	Tuesday == Tuesday = True
	Wednesday == Wednesday = True
	Thursday == Thursday = True
	Friday == Friday = True
	_ == _ = False


stupidFunc :: Day -> Day
stupidFunc d 
            | d == Monday = Tuesday
            | otherwise   = Friday





