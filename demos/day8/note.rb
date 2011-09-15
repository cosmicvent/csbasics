class Note
  attr_accessor :title, :body, :id

  def initialize(id, title, body)
    self.id = id
    self.title = title
    self.body = body
  end

  def save
    file = File.open("data/note-#{id}.txt", 'w')
    file.puts self.title
    file.puts self.body
    file.close
  end

  def self.find_all
    #NOTE: remove the redundant notes collection
    notes = []
    Dir.glob("data/*.txt").reverse.each do |f|
      lines = File.readlines(f)
      note = Note.new(f.split('-')[-1].split('.')[0], lines[0], lines[1..-1].join('\n'))
      notes << note
    end
    return notes
  end

  def self.find(id)
    #NOTE: remove duplication between this and find_all
    lines = File.readlines("data/note-#{id}.txt")
    note = Note.new(id, lines[0], lines[1..-1].join('\n'))
    return note
  end

  def self.delete(id)
    File.delete("data/note-#{id}.txt")
  end
end
