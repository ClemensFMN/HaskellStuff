data MyMaybe a = Nix | MyVal a deriving (Eq, Show)


instance Functor MyMaybe where
  fmap _ Nix = Nix
  fmap f (MyVal a) = MyVal (f a)

-- fmap (\x->x+1) (Val 9)

data Wrap f a = Wrap (f a) deriving (Show)

-- Wrap (Just 4)

instance Functor f => Functor (Wrap f) where
  fmap f (Wrap fa) = Wrap (fmap f fa)

-- fmap (\x->x+1) (Wrap (Just 4))
