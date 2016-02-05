require 'png'

module ColourCard
    class ColourCard::File < Array
        def load(filename, n_desired, pad_colour = nil)
            patches = ::File.readlines(filename)
            patches = patches.map(&:strip)
            patches = patches.keep_if { |x| x.match(/^[^#]/) }
            patches = patches.map(&:split)
            patches = patches.keep_if { |x| x.size == 3 || x.size == 4 }
            patches.each do |x|
                r,g,b,a = x.map { |n| n.to_i }
                a ||= 0xFF
                self.push(PNG::Color.new(r,g,b,a))
            end
            self.pad(n_desired, pad_colour)
        end
        def pad(n, colour = nil)
            if self.size < n
                (1 .. n-self.size).each { self.push(colour) }
            end
        end
    end
end

