<?php

namespace App\Repository;
use App\Entity\Author;

class AuthorRepository extends Repository
{
    public function findAllByBookId(int $id): array
    {
        $query = $this->pdo->prepare("SELECT *FROM Author a
                                        LEFT JOIN `Write` w ON w.Author_id = a.id
                                        WHERE w.Book_id = :Book_id");
        $query->bindParam(':id', $id, $this->pdo::PARAM_STR);
        $query->execute();
        $authors = $query->fetchAll($this->pdo::FETCH_ASSOC);

        $authorsArray = [];

        if ($authors) {
            foreach ($authors as $author) {
                $authorsArray[] = Author::createAndHydrate($author);
            }
        }

        return $authorsArray;
    
    }
}