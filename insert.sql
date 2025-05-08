-- Multiple inserts at once
INSERT INTO Users (
    username, 
    email, 
    password_hash, 
    first_name, 
    last_name, 
    date_of_birth, 
    gender, 
    height_cm, 
    weight_kg, 
    activity_level, 
    goal
) VALUES 
(
    'mike87',
    'mike87@email.com',
    '$2y$10$hashedpassword789...',
    'Michael',
    'Johnson',
    '1987-09-22',
    'Male',
    180.0,
    82.5,
    'Very Active',
    'Gain Weight'
),
(
    'sarah_b',
    'sarah.b@email.com',
    '$2y$10$hashedpassword101...',
    'Sarah',
    'Brown',
    '1995-03-10',
    'Female',
    170.2,
    65.0,
    'Lightly Active',
    'Lose Weight'
),
(
    'alex_n',
    'alex.neutral@email.com',
    '$2y$10$hashedpassword111...',
    'Alex',
    'Taylor',
    '1992-11-30',
    'Other',
    175.0,
    70.0,
    'Sedentary',
    'Maintain Weight'
);


-- Activities
INSERT INTO Activities (name, description, MET_value) VALUES
('Running', 'Outdoor running at moderate pace', 9.80),
('Walking', 'Casual walking', 3.50),
('Cycling', 'Stationary cycling, moderate effort', 7.00);

-- User_Actions
INSERT INTO User_Actions (user_id, activity_id, action_date, steps, calories_burned, average_heart_rate, water_intake_ml) VALUES
(1, 1, '2025-03-24', 8000, 450.25, 120.50, 750),
(1, 2, '2025-03-23', 5000, 250.75, 98.30, 600);

-- User_Progress
INSERT INTO User_Progress (user_id, progress_date, weight_kg, body_fat_percentage, muscle_mass_kg) VALUES
(1, '2025-03-24', 70.5, 18.5, 28.2),
(1, '2025-03-23', 71.0, 19.0, 27.9);

-- Running_Sessions
INSERT INTO Running_Sessions (user_id, session_date, duration_minutes, distance_km, average_pace_min_per_km, calories_burned) VALUES
(1, '2025-03-24', 30, 5.0, 6.00, 320.00),
(1, '2025-03-22', 45, 7.5, 6.00, 470.00);

-- Sleep_Logs
INSERT INTO Sleep_Logs (user_id, sleep_date, sleep_start_time, sleep_end_time, duration_minutes, sleep_quality) VALUES
(1, '2025-03-24', '22:30:00', '06:30:00', 480, 'Good'),
(1, '2025-03-23', '23:00:00', '06:00:00', 420, 'Fair');

-- Body_Composition
INSERT INTO Body_Composition (user_id, measurement_date, body_fat_percentage, muscle_mass_kg, bone_density) VALUES
(1, '2025-03-24', 18.5, 28.2, 1.20),
(1, '2025-03-23', 19.0, 27.9, 1.18);

-- Monthly_Progress
INSERT INTO Monthly_Progress (user_id, month_year, average_weight_kg, average_body_fat_percentage, total_steps, total_calories_burned) VALUES
(1, '2025-03-01', 70.8, 18.7, 150000, 12000.50);

-- Scheduled_Exercises
INSERT INTO Scheduled_Exercises (user_id, exercise_name, scheduled_date, scheduled_time, duration_minutes) VALUES
(1, 'Morning Yoga', '2025-03-25', '07:00:00', 30),
(1, 'Evening Run', '2025-03-25', '18:30:00', 45);

-- Diet_Plans
INSERT INTO Diet_Plans (user_id, plan_name, description, start_date, end_date) VALUES
(1, 'Keto Plan', 'Low-carb high-fat diet', '2025-03-01', '2025-03-31'),
(1, 'Intermittent Fasting', '16:8 fasting window', '2025-03-10', '2025-04-10');

-- Notifications
INSERT INTO Notifications (user_id, message, is_read) VALUES
(1, 'You have a new scheduled exercise today!', FALSE),
(1, 'Don’t forget to log your meals.', TRUE);

-- AI_Chat_Coversations
INSERT INTO AI_Chat_Conversations (user_id, message, response) VALUES
(1, 'How many calories did I burn today?', 'You burned approximately 450.25 kcal.'),
(1, 'What’s my average sleep quality?', 'Your average sleep quality this week is Good.');

INSERT INTO Scheduled_Exercises (user_id, exercise_name, scheduled_date, scheduled_time, duration_minutes)
VALUES (4, 'Morning Yoga', '2025-03-25', '07:00:00', 30);

INSERT INTO Scheduled_Exercises (user_id, exercise_name, scheduled_date, scheduled_time, duration_minutes)
VALUES (4, 'Yoga Class', '2025-03-22', '08:00:00', 45);

INSERT INTO Scheduled_Exercises (user_id, exercise_name, scheduled_date, scheduled_time, duration_minutes)
VALUES (4, 'Swimming', '2025-03-22', '16:00:00', 60);


INSERT INTO Scheduled_Exercises (user_id, exercise_name, scheduled_date, scheduled_time, duration_minutes)
VALUES (4, 'HIIT Session', '2025-03-23', '17:30:00', 30);

INSERT INTO Scheduled_Exercises (user_id, exercise_name, scheduled_date, scheduled_time, duration_minutes)
VALUES (4, 'Meditation', '2025-03-24', '19:00:00', 20);

INSERT INTO Users (
    username,
    email,
    password_hash,
    first_name,
    last_name,
    date_of_birth,
    gender,
    height_cm,
    weight_kg,
    activity_level,
    goal
) VALUES (
    'testuser',
    'test.user@email.com',
    '$2b$10$wLzQ7Xg4nmScuL/JAfFz.eWcGJeSBlsZG1Sfjq9DgNzExPiJflK7i',
    'Test',
    'User',
    '1990-01-01',
    'Other',
    175.0,
    70.0,
    'Moderately Active',
    'Maintain Weight'
);

INSERT INTO Diet_Menu (user_id, meal_type, name, image, calories, protein, fat, carbs, time) VALUES
(4, 'Breakfast', 'Avocado salad', 'images/avocado.jpg', 435, 22, 28, 50, '10:00:00'),
(4, 'Breakfast', 'Blueberry', 'images/blueberry.jpg', 98, 2, 4, 18, '10:30:00'),
(4, 'Breakfast', 'Oatmeal with Nuts', 'images/oatmeal.jpg', 310, 15, 12, 40, '11:00:00'),
(4, 'Breakfast', 'Greek Yogurt', 'images/yogurt.jpg', 150, 20, 5, 8, '11:30:00');


INSERT INTO workout_types (workout_type_id, user_id, name, hours, color) VALUES
(1, 4, 'Cardio', 10, '#3B82F6'),
(2, 4, 'Stretching', 40, '#F59E0B'),
(3, 4, 'Treadmill', 30, '#EC4899'),
(4, 4, 'Strength', 20, '#8B5CF6');

INSERT INTO recommended_workouts (user_id, name, description, difficulty, likes, comments, image) VALUES
(4, 'Dumbbell Biceps', 'Description', 2, 25, 104, '/images/dumbell.png'),
(4, 'Flex Biceps', 'Description', 2, 25, 104, '/images/flex.png');

INSERT INTO Weekly_Activity (user_id, day, value, calories, steps) VALUES
(4, 'Mon', 66, 41250, 7500),
(4, 'Tue', 67, 51212, 9200),
(4, 'Wed', 70, 48210, 8300),
(4, 'Thu', 65, 430, 7800),
(4, 'Fri', 90, 62120, 11500),
(4, 'Sat', 80, 55120, 9800),
(4, 'Sun', 60, 41210, 6900);


UPDATE diet_menu
SET description = 'Mash ripe avocados, mix with lime juice, salt, and pepper. Serve on whole grain toast or as a side with eggs.'
WHERE diet_item_id = 1;

UPDATE diet_menu
SET description = 'Rinse blueberries thoroughly. Enjoy fresh or mix into yogurt, oatmeal, or smoothies.'
WHERE diet_item_id = 2;

UPDATE diet_menu
SET description = 'Cook rolled oats with water or milk. Stir in chopped nuts and cinnamon. Top with honey.'
WHERE diet_item_id = 3;

UPDATE diet_menu
SET description = 'Spoon Greek yogurt into a bowl. Add fruits, honey, and granola for added texture and flavor.'
WHERE diet_item_id = 4;


ALTER TABLE Diet_Menu ADD COLUMN description TEXT;

ALTER TABLE Workout_Types ADD created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE User_Actions 
MODIFY calories_burned DECIMAL(6,2),
MODIFY average_heart_rate DECIMAL(6,2),
MODIFY water_intake_ml DECIMAL(6,2);


UPDATE Recommended_Workouts
SET description = 'How to perform a proper dumbbell bicep curl:\n\n1. Stand upright with a dumbbell in each hand.\n2. Keep your elbows close to your torso and palms facing forward.\n3. Curl the weights while contracting your biceps.\n4. Pause briefly at the top, then lower slowly.\n5. Avoid swinging or using momentum.\n\nMaintain controlled movement and proper posture for best results.'
WHERE workout_id = 1;

UPDATE Recommended_Workouts
SET description = 'Flex Biceps Technique:\n\n1. Stand tall with arms at your sides.\n2. Slowly raise your arms and flex your biceps tightly.\n3. Hold the flex for 3–5 seconds, focusing on peak contraction.\n4. Lower arms and repeat.\n5. Avoid jerking movements or shoulder strain.\n\nGreat for improving mind-muscle connection and bicep definition.'
WHERE workout_id = 2;

UPDATE Diet_Menu
SET description = 'Mash ripe avocados, mix with lime juice, salt, and pepper. Serve on whole grain toast or as a side with eggs.'
WHERE diet_item_id = 1;

UPDATE Diet_Menu
SET description = 'Rinse blueberries thoroughly. Enjoy fresh or mix into yogurt, oatmeal, or smoothies.'
WHERE diet_item_id = 2;

UPDATE Diet_Menu
SET description = 'Cook rolled oats with water or milk. Stir in chopped nuts and cinnamon. Top with honey.'
WHERE diet_item_id = 3;

UPDATE Diet_Menu
SET description = 'Spoon Greek yogurt into a bowl. Add fruits, honey, and granola for added texture and flavor.'
WHERE diet_item_id = 4;

UPDATE Diet_Menu SET description = 'Not specified' WHERE description IS NULL;


-- User_Actions
INSERT INTO User_Actions (user_id, activity_id, action_date, steps, calories_burned, average_heart_rate, water_intake_ml) VALUES
(4, 1, '2025-03-24', 7500, 420.50, 115.75, 800),
(4, 2, '2025-03-23', 6000, 300.25, 102.40, 700);

-- User_Progress
INSERT INTO User_Progress (user_id, progress_date, weight_kg, body_fat_percentage, muscle_mass_kg) VALUES
(4, '2025-03-24', 68.2, 17.8, 27.5),
(4, '2025-03-23', 68.5, 18.2, 27.2);

-- Running_Sessions
INSERT INTO Running_Sessions (user_id, session_date, duration_minutes, distance_km, average_pace_min_per_km, calories_burned) VALUES
(4, '2025-03-24', 28, 4.8, 5.83, 310.00),
(4, '2025-03-22', 42, 7.2, 5.83, 450.00);

-- Sleep_Logs
INSERT INTO Sleep_Logs (user_id, sleep_date, sleep_start_time, sleep_end_time, duration_minutes, sleep_quality) VALUES
(4, '2025-03-24', '22:45:00', '06:15:00', 450, 'Good'),
(4, '2025-03-23', '23:15:00', '06:00:00', 405, 'Fair');

-- Body_Composition
INSERT INTO Body_Composition (user_id, measurement_date, body_fat_percentage, muscle_mass_kg, bone_density) VALUES
(4, '2025-03-24', 17.8, 27.5, 1.18),
(4, '2025-03-23', 18.2, 27.2, 1.16);

-- Monthly_Progress
INSERT INTO Monthly_Progress (user_id, month_year, average_weight_kg, average_body_fat_percentage, total_steps, total_calories_burned) VALUES
(4, '2025-03-01', 68.3, 18.0, 140000, 11500.75);

-- Scheduled_Exercises
INSERT INTO Scheduled_Exercises (user_id, exercise_name, scheduled_date, scheduled_time, duration_minutes) VALUES
(4, 'Morning Jog', '2025-03-25', '07:15:00', 25),
(4, 'Evening Strength Training', '2025-03-25', '19:00:00', 50);

-- Diet_Plans
INSERT INTO Diet_Plans (user_id, plan_name, description, start_date, end_date) VALUES
(4, 'Mediterranean Diet', 'Balanced diet with healthy fats', '2025-03-01', '2025-03-31'),
(4, 'High Protein Plan', 'Increased protein intake for muscle growth', '2025-03-10', '2025-04-10');

-- Diet_Menu
INSERT INTO Diet_Menu (user_id, meal_type, name, image, calories, protein, fat, carbs, time) VALUES
(4, 'Breakfast', 'Avocado salad', 'images/avocado.jpg', 435, 22, 28, 50, '10:00:00'),
(4, 'Breakfast', 'Blueberry', 'images/blueberry.jpg', 98, 2, 4, 18, '10:30:00'),
(4, 'Breakfast', 'Oatmeal with Nuts', 'images/oatmeal.jpg', 310, 15, 12, 40, '11:00:00'),
(4, 'Breakfast', 'Greek Yogurt', 'images/yogurt.jpg', 150, 20, 5, 8, '11:30:00');

-- Weekly_Activity
INSERT INTO Weekly_Activity (user_id, day, value, calories, steps) VALUES
(4, 'Mon', 66, 41250, 7500),
(4, 'Tue', 67, 51212, 9200),
(4, 'Wed', 70, 48210, 8300),
(4, 'Thu', 65, 430, 7800),
(4, 'Fri', 90, 62120, 11500),
(4, 'Sat', 80, 55120, 9800),
(4, 'Sun', 60, 41210, 6900);

-- Recommended_Workouts
INSERT INTO Recommended_Workouts (user_id, name, description, difficulty, likes, comments, image) VALUES
(4, 'Dumbbell Biceps', 'Description', 2, 25, 104, '/images/dumbell.png'),
(4, 'Flex Biceps', 'Description', 2, 25, 104, '/images/flex.png');

-- Workout_Types
INSERT INTO Workout_Types (workout_type_id, user_id, name, hours, color) VALUES
(1, 4, 'Cardio', 10, '#3B82F6'),
(2, 4, 'Stretching', 40, '#F59E0B'),
(3, 4, 'Treadmill', 30, '#EC4899'),
(4, 4, 'Strength', 20, '#8B5CF6');

-- Users
INSERT INTO Users (
  username, email, password_hash, first_name, last_name,
  date_of_birth, gender, activity_level, goal, height_cm, weight_kg
) VALUES (
  'john_doe', 'john.doe@email.com',
  '$2a$10$exampleHashValueHere',
  'John', 'Doe', '1990-05-15', 'Male',
  'Moderately Active',
  'Lose Weight', 180, 75
);

-- Activities
INSERT INTO Activities (name, description, MET_value) VALUES
('Yoga', 'Hatha yoga session', 4.0),
('Strength Training', 'Weight lifting session', 6.0),
('Swimming', 'Freestyle laps', 8.0);

-- Goals
INSERT INTO Goals (user_id, goal_type, target_value, start_date, end_date) VALUES
(4, 'Weight Loss', 65.0, '2025-03-01', '2025-06-01'),
(4, 'Muscle Gain', 30.0, '2025-03-01', '2025-06-01');

-- Notifications
INSERT INTO Notifications (user_id, message, is_read) VALUES
(4, 'Your workout plan has been updated', FALSE),
(4, 'Weekly progress report available', TRUE);

-- test.user@email.com
-- testuser
-- test1234