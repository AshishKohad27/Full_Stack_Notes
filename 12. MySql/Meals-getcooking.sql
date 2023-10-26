-- 1. Create DataBase
CREATE DATABASE IF NOT EXISTS getcooking; 

-- 2. Use That DB
use getcooking;

-- 3. Create Table for getCooking
CREATE TABLE IF NOT EXISTS meals (
    idMeal INT AUTO_INCREMENT PRIMARY KEY,
	idMealData INT NOT NULL,
    strMeal VARCHAR(250),
    strCategory VARCHAR(120),
    strArea VARCHAR(100),
    strInstructions TEXT,
    strMealThumb TEXT NOT NULL,
    strTags TEXT,
    strYoutube TEXT
);

-- 4. DESC Schema
-- DESC meals;

-- 5. Ref. id from meal and putting Ingredient and Measurment :- Table
CREATE TABLE IF NOT EXISTS meal_ingredients (
    idIngMes INT AUTO_INCREMENT PRIMARY KEY,
    idMeal INT NOT NULL,
    strIngredient VARCHAR(255),
    strMeasure VARCHAR(255),
    FOREIGN KEY (idMeal) REFERENCES meals(idMeal)
);

-- 6. DESC Schema
-- DESC meal_ingredients;

-- 7. putting new value inside meal table
INSERT INTO meals (
	idMealData,
    strMeal ,
    strCategory ,
    strArea ,
    strInstructions ,
    strMealThumb   ,
    strTags ,
    strYoutube
)
VALUE(
	 52771,
	 "Spicy Arrabiata Penne",
	 "Vegetarian",
	 "Italian",
	 "Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.\r\nIn a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.\r\nDrain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.",
	 "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg",
	 "Pasta,Curry",
	 "https://www.youtube.com/watch?v=1IszT_guI08"
);

-- 8. View Inserted Table
-- SELECT * FROM meals;

-- 9. Get the generated idMeal for the inserted meal
SET @mealId = LAST_INSERT_ID();

-- 10. Insert ingredients and measures for the meal into the meal_ingredients table
INSERT INTO meal_ingredients (idMeal, strIngredient, strMeasure) VALUES 
	(@mealId, 'penne rigate', '1 pound'),
	(@mealId, 'olive oil', '1/4 cup'),
	(@mealId, 'garlic', '3 cloves'),
	(@mealId, 'garlic', '1 tin'),
	(@mealId, 'chopped tomatoes', '1/2 teaspoon'),
	(@mealId, 'red chile flakes', '1/2 teaspoon	'),
	(@mealId, 'italian seasoning', '6 leaves'),
	(@mealId, 'basil', 'spinkling')
;

-- 11. View Inserted Table
SELECT * FROM meal_ingredients;

-- SELECT * FROM meals;