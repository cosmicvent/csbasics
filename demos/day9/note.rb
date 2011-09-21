class Note
  attr_accessor :title, :body, :id

  def initialize(title, body, id = Time.now.strftime("%Y%m%d%H%M%S"))
    self.id = id
    self.title = title
    self.body = body
  end

  def save
    file = File.open(file_path, 'w')
    file.puts self.title
    file.puts self.body
    file.close
  end

  def self.find_all
    Dir.glob("data/*.txt").reverse.map do |f|
      Note.from_file(f)
    end
  end

  def self.find(id)
    Note.from_file("data/note-#{id}.txt")
  end

  def self.delete(id)
    File.delete(file_path)
  end

  private
  def self.from_file(filename)
    id = filename.split('-')[-1].split('.')[0]
    lines = File.readlines(filename)
    Note.new(lines[0], lines[1..-1].join('\n'), id)
  end

  def file_path
    "data/note-#{id}.txt"
  end
end
