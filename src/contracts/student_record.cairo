// use core::starknet::ContractAddress;

use crate::interfaces::Ischool_record::IStudentRecord;
use crate::interfaces::Ischool_library::{ISchoolLibraryDispatcher, ISchoolLibraryDispatcherTrait};

// Student Record 
#[starknet::contract]
pub mod StudentRecord {
    use core::starknet::storage::StorageMapWriteAccess;
    use super::ISchoolLibraryDispatcherTrait;
    use core::starknet::storage::Map;
    use super::ISchoolLibraryDispatcher;
    use core::starknet::ContractAddress;

    #[storage]
    struct Storage {
        borrow_books: Map<felt252, felt252>
    }

    #[event]
    #[derive(Copy, Drop, starknet::Event)]
    enum Event {
        BookBorrowed: BookBorrowed,
    }

    #[derive(Copy, Drop, starknet::Event)]
    struct BookBorrowed {
        student_name: felt252,
        book_name: felt252,
        response: felt252,
    }

    #[abi(embed_v0)]
    impl StudentRecordImpl of super::IStudentRecord<ContractState> {
        fn borrow_book_from_lib(ref self: ContractState, book_name: felt252, student_name: felt252, lib_address: ContractAddress) -> bool {
            let lib_dispatcher = ISchoolLibraryDispatcher{ contract_address: lib_address };
            let check = lib_dispatcher.borrow_book(book_name);
            if check {
                self.borrow_books.write(student_name, book_name);
                self.emit(
                    BookBorrowed {
                        student_name,
                        book_name,
                        response: 'Book borrowed',
                    }
                );
                return true;
            } else {
                return false;
            }
            
        }
    }
}