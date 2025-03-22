// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Metacircle {

    // Struct to represent a User
    struct User {
        address userAddress;
        string username;
        string bio;
    }
    
    // Struct to represent a Post
    struct Post {
        uint postId;
        address author;
        string content;
        uint likes;
        mapping(address => bool) likedBy; // Mapping to track which users have liked the post
        uint[] commentIds;  // Array to store comment IDs associated with the post
    }

    // Struct to represent a Comment
    struct Comment {
        uint commentId;
        string authorUsername; // Store the username of the commenter
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

}
