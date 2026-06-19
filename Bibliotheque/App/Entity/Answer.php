<?php

namespace App\Entity;

class Answer extends Entity
{

    protected ?int $id = null;
    protected string $book_read = '';
    protected string $book_consulted = '';
    protected string $book_being_read = '';
    protected string $comment = '';
    

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
     * Get the value of book_read
     */
    public function getBookRead(): string
    {
        return $this->book_read;
    }

    /**
     * Set the value of book_read
     */
    public function setBookRead(string $book_read): self
    {
        $this->book_read = $book_read;

        return $this;
    }

    /**
     * Get the value of book_consulted
     */
    public function getBookConsulted(): string
    {
        return $this->book_consulted;
    }

    /**
     * Set the value of book_consulted
     */
    public function setBookConsulted(string $book_consulted): self
    {
        $this->book_consulted = $book_consulted;

        return $this;
    }

    /**
     * Get the value of book_being_read
     */
    public function getBookBeingRead(): string
    {
        return $this->book_being_read;
    }

    /**
     * Set the value of book_being_read
     */
    public function setBookBeingRead(string $book_being_read): self
    {
        $this->book_being_read = $book_being_read;

        return $this;
    }

    /**
     * Get the value of comment
     */
    public function getComment(): string
    {
        return $this->comment;
    }

    /**
     * Set the value of comment
     */
    public function setComment(string $comment): self
    {
        $this->comment = $comment;

        return $this;
    }
}