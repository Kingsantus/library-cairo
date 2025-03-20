// 1. School Library
    // - Add Books
    // - Borrow Books
// 2. Student Record
    // - Borrow Books from School Library

// Struct
// #[derive(Copy, Drop, Serde)]
// pub struct Book {
//     title: felt252,
//     author: felt252,
//     year: u16,
//     edition: felt252,
// }

//  2. Student Record
    // - Borrow Books from School Library

// pub mod interfaces;
// pub mod school_library;
// pub mod student_record;

// use interfaces::{ISchoolLibrary, IStudentRecord};
// use student_record::StudentRecord;
// use school_library::SchoolLibrary;

pub mod interfaces {
    pub mod Ischool_library;
    pub mod Ischool_record;
}

pub mod contracts {
    pub mod school_library;
    pub mod student_record;
}