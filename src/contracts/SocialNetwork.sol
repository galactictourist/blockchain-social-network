pragma solidity ^0.5.0;


contract SocialNetwork {
    string public name;
    uint256 public postCount = 0;
    mapping(uint256 => Post) public posts;

    struct Post {
        uint256 id;
        string content;
        uint256 tipAmount;
        address payable author;
    }

    event PostCreated(
        uint256 id,
        string content,
        uint256 tipAmount,
        address payable author
    );

    event PostTipped(
        uint256 id,
        string content,
        uint256 tipAmount,
        address payable author
    );

    constructor() public {
        name = "yarble";
    }

    function createPost(string memory _content) public {
        require(bytes(_content).length > 0, "Post must have content");

        postCount++;

        posts[postCount] = Post(postCount, _content, 0, msg.sender);

        //trigger event
        emit PostCreated(postCount, _content, 0, msg.sender);
    }

    function tipPost(uint256 _id) public payable {
        //fetch post
        Post memory _post = posts[_id];
        //fetch author
        address payable _author = post.author;
        // pay author
        address(_author).transfer(msg.value);
        //increment tip amount
        _post.tipAmount = _post.tipAmount + msg.value;
        //update the post
        posts[_id] = _post;
        //trigger event
    }
}
