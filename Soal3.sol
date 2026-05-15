// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract Soal3 {
    struct Student {
        string name;
        uint256 grade;
    }
    Student[] public students;

    function addStudent(string calldata _name, uint256 _grade) public {
        students.push(Student(_name, _grade));
    }

    function updateGrade(uint256 _index) public {
        Student storage student = students[_index];
        student.grade = 80;
    }

    function getStudent(uint256 _index) public view returns (Student memory) {
        Student memory student = students[_index];

        return student;
    }
}