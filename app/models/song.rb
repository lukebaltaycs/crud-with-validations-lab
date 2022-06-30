class Song < ApplicationRecord

    validates :title, presence: true
    validates_uniqueness_of :title, scope: :release_year
    validates :released, inclusion: { in: [ true, false ] }
    validates :release_year, presence: true, if: -> {released == true}
    validates :release_year, numericality: {less_than: 2022}, if: -> {released == true}
    validates :artist_name, presence: true


    def do_thing
        year = 1980
        arr = []
        43.times do |go|
            arr << [year.to_s, year]
            year+=1
        end
        arr
    end
end
