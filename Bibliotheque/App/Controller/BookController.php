<?php

namespace App\Controller;

use App\Repository\AuthorRepository;
use App\Repository\TypeRepository;
use App\Repository\BookRepository;

class BookController extends Controller
{
    public function route(): void
    {
        try {
            if (isset($_GET['action'])) {
                switch ($_GET['action']) {
                    case 'show':
                        $this->show();
                        break;
                    case 'list':
                        $this->list();
                        break;
                    default:
                        throw new \Exception("Cette action n'existe pas : " . $_GET['action']);
                        break;
                }
            } else {
                throw new \Exception("Aucune action détectée");
            }
        } catch (\Exception $e) {
            $this->render('errors/default', [
                'error' => $e->getMessage()
            ]);
        }
    }
    /**
     * ?controller=book&action=show&id=1
     */

    protected function show()
    {
        try {
            if (isset($_GET['id'])) {
                // Récupérer un livre avec le Repository
                $bookRepository = new BookRepository();
                $id = (int)$_GET['id'];
                $book = $bookRepository->findOneById($id);
                
                $this->render('book/show', [
                    'book' => $book, 
                ]);

            } else {
                throw new \Exception("L'id est manquant en paramètre d'url");
                
            }

        } catch (\Exception $e) {
            $this->render('errors/default', [
                'error' => $e->getMessage()
            ]);
        } 
    }

    /*?controller=book&action=list*/
    protected function list()
    {
        try {
            // Récupérer tous les livres
            $bookRepository = new BookRepository();
            $books = $bookRepository->findAll();

            $this->render('book/list', [
                'books' => $books,
            ]);

        } catch (\Exception $e) 
        {
            $this->render('errors/default', [
                'error' => $e->getMessage()
            ]);
        } 
    }
}