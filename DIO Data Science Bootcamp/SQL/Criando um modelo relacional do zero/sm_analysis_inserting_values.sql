use social_media_analysis;

-- Insert values into Users table
INSERT INTO Users (UserName, Email, JoinDate) VALUES
    ('user1', 'user1@example.com', '2023-07-18'),
    ('user2', 'user2@example.com', '2023-07-18'),
    ('user3', 'user3@example.com', '2023-07-18'),
    ('user4', 'user4@example.com', '2023-07-18');

-- Insert values into Posts table
INSERT INTO Posts (UserID, Content, PostDate) VALUES
    (1, 'This is the first post by user1.', '2023-07-18 10:00:00'),
    (2, 'Hello from user2!', '2023-07-18 11:30:00'),
    (3, 'Post by user3 with a hashtag #cool', '2023-07-18 12:15:00'),
    (4, 'I am user4 and I like social media!', '2023-07-18 13:45:00');

-- Insert values into Comments table
INSERT INTO Comments (PostID, UserID, CommentText, CommentDate) VALUES
    (1, 2, 'Nice post!', '2023-07-18 10:30:00'),
    (1, 3, 'Great content!', '2023-07-18 10:45:00'),
    (2, 1, 'Hello user2!', '2023-07-18 11:45:00');

-- Insert values into Likes table
INSERT INTO Likes (PostID, UserID, LikeDate) VALUES
    (1, 3, '2023-07-18 10:32:00'),
    (2, 4, '2023-07-18 12:00:00'),
    (2, 3, '2023-07-18 12:05:00'),
    (3, 1, '2023-07-18 12:30:00');

-- Insert values into Hashtags table
INSERT INTO Hashtags (HashtagName) VALUES
    ('cool'),
    ('awesome'),
    ('socialmedia');

-- Insert values into PostHashtags table
INSERT INTO PostHashtags (PostID, HashtagID) VALUES
    (3, 1),
    (3, 2);

-- Insert values into Shares table
INSERT INTO Shares (OriginalPostID, SharedPostID, ShareDate) VALUES
    (1, 2, '2023-07-18 11:45:00'),
    (1, 4, '2023-07-18 13:00:00');

-- Insert values into Follows table
INSERT INTO Follows (FollowerID, FollowerNameTag, Country) VALUES
    (1, 'user1', 'USA'),
    (2, 'user2', 'UK'),
    (3, 'user3', 'Canada'),
    (4, 'user4', 'Australia');

-- Insert values into UserActivity table
INSERT INTO UserActivity (UserID, LoginDate, PostCount, CommentCount, ShareCount) VALUES
    (1, '2023-07-18 10:00:00', 1, 1, 1),
    (2, '2023-07-18 11:00:00', 1, 1, 1),
    (3, '2023-07-18 12:00:00', 1, 2, 0),
    (4, '2023-07-18 13:00:00', 1, 0, 1);


