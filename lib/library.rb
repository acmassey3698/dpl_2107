class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(name)
    @authors << name
    add_books(name)
  end

  def add_books(author)
    @books << author.books
    @books = @books.flatten
  end

  def publication_time_frame_for(author)
    time_frame = {:start => 'string', :end => 'string'}

    dates =
    author.books.map do |book|
      book.publication_year
    end

    start_integer =
    dates.min_by do |date|
      date.to_i
    end

    end_integer =
    dates.max_by do |date|
      date.to_i
    end

    time_frame[:start] = start_integer.to_s
    time_frame[:end] = end_integer.to_s
    time_frame
  end

end
