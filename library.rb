class Book
  @@counter=1
  def initialize(title, author)
    @title=title
    @author = author
    # @id = id
    @status = "available"
    @id=@@counter
    @@counter+=1
  end

  attr_accessor :title
  attr_accessor :author
  attr_accessor :id
  attr_accessor :status
  attr_accessor :available

  def check_out
    if @status=="checked_out"
      return false
    else
      @status="checked_out"
      true
    end
  end

  def check_in
    if @status=="checked_out"
      @status="available"
    end
  end


end


class Borrower
  attr_accessor :name
  attr_accessor :checked_out

  def initialize(name)
    @name = name
    @checked_out = []
  end


end

class Library

  def initialize
    @books = []
    @library ={}
  end
  attr_accessor :books
  attr_accessor :id

  def register_new_book(title,author)
    @books.push(Book.new(title,author))
  end

  def add_book(title, author)
  end


  def check_out_book(book_id, borrower)
    book = @books.find{|book| book.id==book_id}
    if book.status == "checked_out" || borrower.checked_out.length >= 2
      return nil
    else
      # book = @books.find{|book| book.id==book_id}
      borrower.checked_out << book
      book.status = "checked_out"
      @library[book.id]= borrower.name
      book
    end
  end

  def get_borrower(book_id)
    @library[book_id]
  end

  def check_in_book(book)
    book.status = "available"
  end

  def available_books
    @books.select { |book| book.status == "available"}
  end

  def borrowed_books
    @books.select { |book| book.status == "checked_out"}
  end
end
