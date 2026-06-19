<?php

namespace App\Repository;
use App\Entity\Type;

class TypeRepository extends Repository
{
    public function findAllByBookId(int $id): array
    {
        $query = $this->pdo->prepare("SELECT * FROM Type t
                                      LEFT JOIN Belong b ON b.Type_id = t.id
                                      WHERE b.Book_id = :Book_id");
        $query->bindParam(':id', $id, $this->pdo::PARAM_STR);
        $query->execute();
        $types = $query->fetchAll($this->pdo::FETCH_ASSOC);

        $typesArray = [];

        if ($types) {
            foreach ($types as $type) {
                $typesArray[] = Type::createAndHydrate($type);
            }
        }
        return $typesArray;
    }
}