<?php

namespace App\Entity;



class Image extends Entity
{

    protected ?int $id = null;
    protected string $image_data = '';
    

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
     * Get the value of image_data
     */
    public function getImageData(): string
    {
        return $this->image_data;
    }

    /**
     * Set the value of image_data
     */
    public function setImageData(string $image_data): self
    {
        $this->image_data = $image_data;

        return $this;
    }
    public function getImagePath():string
    {
if ($this->getImageData()){
    return BOOKS_IMAGES_FOLDER.$this->getImageData();
}else {
    return ASSETS_IMAGES_FOLDER."default-book.jpg";
}
    }
}