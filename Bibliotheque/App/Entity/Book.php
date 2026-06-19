<?php

namespace App\Entity;

use DateTime;

class Book extends Entity
{

    protected ?int $id = null;
    protected string $title = '';
    protected string $resume = '';
    protected DateTime $release_date;
    protected int $number_of_the_pages ;
    protected string $image_name = '';
   
    /**
     * Get the value of id
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Set the value of id
     */
    public function setId(?int $id): self
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of title
     */
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * Set the value of title
     */
    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get the value of resume
     */
    public function getResume(): string
    {
        return $this->resume;
    }

    /**
     * Set the value of resume
     */
    public function setResume(string $resume): self
    {
        $this->resume = $resume;

        return $this;
    }

    /**
     * Get the value of release_date
     */
    public function getReleaseDate(): DateTime
    {
        return $this->release_date;
    }

    /**
     * Set the value of release_date
     */
    public function setReleaseDate(DateTime $release_date): self
    {
        $this->release_date = $release_date;

        return $this;
    }

    /**
     * Get the value of number_of_the_pages
     */
    public function getNumberOfThePages(): int
    {
        return $this->number_of_the_pages;
    }

    /**
     * Set the value of number_of_the_pages
     */
    public function setNumberOfThePages(int $number_of_the_pages): self
    {
        $this->number_of_the_pages = $number_of_the_pages;

        return $this;
    }

    /**
     * Get the value of image_name
     */
    public function getImageName(): string
    {
        return $this->image_name;
    }

    /**
     * Set the value of image_name
     */
    public function setImageName(string $image_name): self
    {
        $this->image_name = $image_name;

        return $this;
    }

    
    public function getImagePath():string
    {
        if ($this->getImageName()) {
            return BOOKS_IMAGES_FOLDER.$this->getImageName();
        } else {
            return ASSETS_IMAGES_FOLDER."default-book.png";
        }
    }


}