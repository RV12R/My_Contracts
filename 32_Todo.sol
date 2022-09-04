// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo {
        string text;
        bool progress;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({text: _text, progress: false}));
    }

    function update(uint _num, string calldata _text) external {
        todos[_num].text = _text; 
        // Because we have only have one element in the struct to change
        // the above mentioned method is gas efficient. But when we 
        // have more elements to change then we need to get get data 
        // from the array for each elements, that costs more gas.
        
        // Use this for those case
        // Todo storage todo = todos[_num];
        // todo.text = _text;
    }

    //This is not really needed
    function get(uint _index) external view returns(string memory, bool) {
        Todo memory _todo = todos[_index];
        return (_todo.text, _todo.progress); 
    }

    function toggleProgress(uint _index) external {
        todos[_index].progress = !todos[_index].progress;
    }
}
