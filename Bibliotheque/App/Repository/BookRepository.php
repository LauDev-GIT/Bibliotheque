<?php

namespace App\Repository;
use App\Entity\Book;

class BookRepository extends Repository
{ 
    public function findOneById(int $id): Book|bool
    {
        $query = $this->pdo->prepare("SELECT * FROM Book WHERE id = :id");
        $query->bindParam(':id', $id, $this->pdo::PARAM_STR);
        $query->execute();
        $bookData = $query->fetch($this->pdo::FETCH_ASSOC);
        if ($bookData) {
            return Book::createAndHydrate($bookData);
        } else {
            return false;
        }
    }

    public function findAll(): array
    {
        $query = $this->pdo->prepare("SELECT * FROM book");
        $query->execute();
        $books = $query->fetchAll($this->pdo::FETCH_ASSOC);

        $booksArray = [];

        if ($books) {
            foreach ($books as $book) {
                $booksArray[] = Book::createAndHydrate($book);
            }
        }
        return $booksArray;
    }
}