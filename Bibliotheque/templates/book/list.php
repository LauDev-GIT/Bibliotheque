<?php require_once _ROOTPATH_ . '/templates/header.php';
?>

<div class="row">
    <?php foreach ($books as $book) {
        /** @var App\Entity\Book $book */
    ?>
        <div class="col-md-4 my-2">
            <div class="card w-100">
                <img src="<?=$book->getImagePath() ?>" class="card-img-top" alt="<?= $book->getTitle() ?>">
                <div class="card-body">
                    <h5 class="card-title"><?= $book->getTitle() ?></h5>
                    <a href="/index.php?controller=book&action=show&id=<?= $book->getId() ?>" class="btn btn-primary">Voir la fiche</a>
                </div>
            </div>

        </div>
    <?php } ?>
</div>



<?php require_once _ROOTPATH_ . '/templates/footer.php'; ?>