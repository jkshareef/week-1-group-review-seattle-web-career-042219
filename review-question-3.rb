# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class

class User
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_photo
    Photo.new(self)
  end

  def photos
    Photo.all.select {|photo| photo.user == self}
  end
end

class Photo
  @@all = []
  attr_accessor :user
  def initialize(user=nil)
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  def make_comment(message)
    Comment.new(self, message)
  end

  def comments
    get_comment_instances.map {|element| element.comment}
  end

  def get_comment_instances
    Comment.all.select {|comment| comment.photo == self}
  end

end

class Comment
  @@all = []
  attr_accessor :photo, :message

  def initialize(photo, message)
    @photo = photo
    @message = message
    @@all << self
  end

  def self.all
    @@all
  end

end

sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
