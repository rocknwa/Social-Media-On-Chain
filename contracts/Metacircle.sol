// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Metacircle {

    // Struct to represent a user
    struct User {
        address userAddress;
        string username;
        string bio;
    }
    
    // Struct to represent a post
    struct Post {
        uint postId;
        address author;
        string content;
        uint likes;
        mapping(address => bool) likedBy; // Mapping to track which users have liked the post
        uint[] commentIds;  // Array to store comment IDs associated with the post
    }

    // Struct to represent a comment
    struct Comment {
        uint commentId;
        string authorUsername;  // Store the username of the commenter
        uint postId;
        string content;
    }

    // Mappings to store users, posts, and comments
    mapping(address => User) public users;
    mapping(uint => Post) public posts;
    mapping(uint => Comment) public comments;

    // Counters for posts and comments
    uint public postCount;
    uint public commentCount;

    // User Registration
    function createUser(string memory _username, string memory _bio) public {
        require(bytes(users[msg.sender].username).length == 0, "User already exists.");
        users[msg.sender] = User(msg.sender, _username, _bio); 
    }

    // Function to get the username from an account address
    function getUsername(address _userAddress) public view returns (string memory) {
        require(bytes(users[_userAddress].username).length != 0, "User does not exist.");
        return users[_userAddress].username;
    }

    // Creating a post
    function createPost(string memory _content) public {
        require(bytes(users[msg.sender].username).length != 0, "User does not exist.");
        postCount++;
        Post storage newPost = posts[postCount];
        newPost.postId = postCount;
        newPost.author = msg.sender;
        newPost.content = _content;
        newPost.likes = 0;
    }
}