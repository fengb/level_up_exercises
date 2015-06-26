The Five-Second-Rule for code review essentially states that code should be written legibly enough that someone who has not been exposed to the code before *should* be able to read it effectively within 5 seconds.  To achieve the goal requires meaningful vocabulary for methods and variables that *actually describe what the object is*.  A variable representing an array of cats (let's say they're marching in-line) for example, would be named "marching_cats".  A method that returns a boolean on the Class Cat that asks if an instance of the kitty is cuddly or not, would most sensibly  be called "cuddly?".

Thus, `marching_cats.first.cuddly?` asks: Is the first cat in the line of marching cats very cuddly?


Obviously, the answer is always *true*.
