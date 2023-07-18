-- DROP DATABASE social_media_analysis;

CREATE DATABASE social_media_analysis;

USE social_media_analysis;

-- Table for Users
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL
);

-- Table for Posts
CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    Content TEXT NOT NULL,
    PostDate DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table for Comments
CREATE TABLE Comments (
    CommentID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    CommentText TEXT NOT NULL,
    CommentDate DATETIME NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table for Likes
CREATE TABLE Likes (
    LikeID INT AUTO_INCREMENT PRIMARY KEY,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    LikeDate DATETIME NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table for Hashtags
CREATE TABLE Hashtags (
    HashtagID INT AUTO_INCREMENT PRIMARY KEY,
    HashtagName VARCHAR(50) NOT NULL
);

-- Table for Posts-Hashtags relationship
CREATE TABLE PostHashtags (
    PostID INT NOT NULL,
    HashtagID INT NOT NULL,
    PRIMARY KEY (PostID, HashtagID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (HashtagID) REFERENCES Hashtags(HashtagID)
);

-- Table for Shares
CREATE TABLE Shares (
    ShareID INT AUTO_INCREMENT PRIMARY KEY,
    OriginalPostID INT NOT NULL,
    SharedPostID INT NOT NULL,
    ShareDate DATETIME NOT NULL,
    FOREIGN KEY (OriginalPostID) REFERENCES Posts(PostID),
    FOREIGN KEY (SharedPostID) REFERENCES Posts(PostID)
);

-- Table for Follows (User relationships)
CREATE TABLE Follows (
    FollowerID INT NOT NULL,
	FollowerNameTag VARCHAR(45) NOT NULL,
    Country VARCHAR(45),
    PRIMARY KEY (FollowerID),
    FOREIGN KEY (FollowerID) REFERENCES Users(UserID)
);

-- Table for UserActivity
CREATE TABLE UserActivity (
    ActivityID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    LoginDate DATETIME NOT NULL,
    PostCount INT DEFAULT 0,
    CommentCount INT DEFAULT 0,
    ShareCount INT DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
