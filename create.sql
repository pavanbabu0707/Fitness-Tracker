-- User table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    height_cm DECIMAL(5,2),
    weight_kg DECIMAL(5,2),
    activity_level ENUM('Sedentary', 'Lightly Active', 'Moderately Active', 'Very Active'),
    goal ENUM('Lose Weight', 'Maintain Weight', 'Gain Weight'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Activities Table
CREATE TABLE Activities (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    MET_value DECIMAL(4,2)
);

-- Create User_Actions Table
CREATE TABLE User_Actions (
    action_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    activity_id INT,
    action_date DATE NOT NULL,
    steps INT,
    calories_burned DECIMAL(6,2),
    average_heart_rate DECIMAL(6,2),
    water_intake_ml DECIMAL(6,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id) ON DELETE SET NULL
);

-- Create User_Progress Table
CREATE TABLE User_Progress (
    progress_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    progress_date DATE NOT NULL,
    weight_kg DECIMAL(5,2),
    body_fat_percentage DECIMAL(4,2),
    muscle_mass_kg DECIMAL(5,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Running_Sessions Table
CREATE TABLE Running_Sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    session_date DATE NOT NULL,
    duration_minutes INT,
    distance_km DECIMAL(5,2),
    average_pace_min_per_km DECIMAL(4,2),
    calories_burned DECIMAL(5,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Sleep_Logs Table
CREATE TABLE Sleep_Logs (
    sleep_log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    sleep_date DATE NOT NULL,
    sleep_start_time TIME,
    sleep_end_time TIME,
    duration_minutes INT,
    sleep_quality ENUM('Poor', 'Fair', 'Good', 'Excellent'),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Body_Composition Table
CREATE TABLE Body_Composition (
    composition_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    measurement_date DATE NOT NULL,
    body_fat_percentage DECIMAL(4,2),
    muscle_mass_kg DECIMAL(5,2),
    bone_density DECIMAL(4,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Monthly_Progress Table
CREATE TABLE Monthly_Progress (
    monthly_progress_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    month_year DATE NOT NULL,
    average_weight_kg DECIMAL(5,2),
    average_body_fat_percentage DECIMAL(4,2),
    total_steps INT,
    total_calories_burned DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Scheduled_Exercises Table
CREATE TABLE Scheduled_Exercises (
    schedule_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    exercise_name VARCHAR(100) NOT NULL,
    scheduled_date DATE NOT NULL,
    scheduled_time TIME,
    duration_minutes INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Diet_Plans Table
CREATE TABLE Diet_Plans (
    diet_plan_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Notifications Table
CREATE TABLE Notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create AI_Chat_Conversations Table
CREATE TABLE AI_Chat_Conversations (
    conversation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    message TEXT NOT NULL,
    response TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


-- Goals Table
CREATE TABLE Goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    target VARCHAR(50),
    progress INT CHECK (progress BETWEEN 0 AND 100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Workout_Types Table
CREATE TABLE Workout_Types (
    workout_type_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    hours INT,
    color VARCHAR(7),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Recommended_Workouts Table
CREATE TABLE Recommended_Workouts (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    difficulty INT CHECK (difficulty BETWEEN 1 AND 5),
    likes INT,
    comments INT,
    image VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Diet_Menu Table
CREATE TABLE Diet_Menu (
    diet_item_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    meal_type ENUM('Breakfast', 'Lunch', 'Dinner', 'Snack'),
    name VARCHAR(100) NOT NULL,
    image VARCHAR(255),
    calories INT,
    protein INT,
    fat INT,
    carbs INT,
    time TIME,
    description TEXT,

    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Weekly_Activity Table
CREATE TABLE Weekly_Activity (
    activity_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    day ENUM('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'),
    value INT,
    calories INT,
    steps INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- User_Settings Table (for avatar and location)
CREATE TABLE User_Settings (
    setting_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    location VARCHAR(100),
    avatar VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
