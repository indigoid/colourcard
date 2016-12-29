require 'png'

module ColourCard
    class ColourCard::File < Array
        def load(filename, n_desired, pad_colour = nil)
            patches = ::File.readlines(filename)
            patches = patches.map(&:strip)
            patches = patches.keep_if { |x| x.match(/^[^#]/) }
            patches.each do |x|
                rgba,desc = x.split(/\s*##\s*/)
                r,g,b,a = rgba.split(/\s+/).map { |n| n.to_i(10) }
                a ||= 255
                self.push({ :colour => PNG::Color.new(r,g,b,a), :desc => desc})
            end
            self.pad(n_desired, pad_colour)
        end
        def pad(n, colour = nil, desc = nil)
            if self.size < n
                (1 .. n-self.size).each { self.push({ :colour => colour, :desc => desc } ) }
            end
        end
    end
end

