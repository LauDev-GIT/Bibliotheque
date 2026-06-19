<?php require_once _ROOTPATH_ . '/templates/header.php';
/** @var App\Entity\Book $book */
?>
<h1 class="display-5 fw-bold text-body-emphasis lh-1 mb-3"><?= $book->getTitle() ?></h1>

<div class="row">
    <div class="col">
        Date de publication:
        <?php
        if ($book->getReleaseDate()) {
            echo $book->getReleaseDate()->format("d/m/Y");
        } else {
            echo "N/C";
        } ?>
    </div>
    <div class="col">
        Nombre de Page:
        <?php
        if ($book->getNumberOfThePages()) {
            echo $book->getNumberOfThePages();
        } else {
            echo "N/C";
        } ?>
    </div>
    
</div>

<div class="row align-items-start g-5 py-5">
    <div class="col-lg-8">
        <p class="lead"><?= $book->getResume() ?></p>
    </div>
    <div class="col-12 col-sm-8 col-lg-4">
        <img src="<?= $book->getImagePath() ?>" class="d-block mx-lg-auto img-fluid" alt="<?= $book->getTitle() ?>" width="700" height="500" loading="lazy">
    </div>
</div>

<?php require_once _ROOTPATH_ . '/templates/footer.php'; ?>