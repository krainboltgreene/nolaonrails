# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..6).each do |week|
  (1..3).each do |day|
    course = Course.create title: 'Something Something', description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat nonproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', week: week, day: day
    course.create_resource slide: 'http://slide.com', source: 'http://source.com', video: 'http://video.com', audio: 'http://audio.com'
    course.links.create name: 'Example 1', url: 'http://example.com/1'
    course.links.create name: 'Example 2', url: 'http://example.com/2'
    course.links.create name: 'Example 3', url: 'http://example.com/3'
  end
end
