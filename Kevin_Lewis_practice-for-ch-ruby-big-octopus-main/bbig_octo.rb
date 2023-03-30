def sluggish(fishes)
    lengths = Hash.new { |h,k| h[k] = []}
    fishes.each_with_index do |f1, idx1|
        lengths[f1] == f1.length
    end
    lengths.sort_by { |k, v| v} [-1][0]
    end
end

class Array #maybe not
    def merge_sort(&prc)
        prc ||= Proc.new{ |a,b| a<=>b }
        return self if self.length <= 1
        idx = self.length / 2
        left = self[0...idx]
        right = self[idx..-1]
        left_side = left.merge_sort(&prc)
        right_side = right.merge_sort(&prc)
        Array.merge(left_side, right_side, &prc)
    end


    def self.merge(left, right, &prc)
        new_array = []

        until left.empty? || right.empty?

            if prc.call(left, right) < 0
                new_array << left.shift
            else
                new_array << right.shift
            end
        end
        new_array + right + left
    end


    def clever_octopus(fishes)
        prc = Proc.new{|a,b| a <=> b}
        fishes.merge_sort(&prc)[0]
    end
end


class Array
    def dancing_octopus(dir, squares)
        squares.each_with_index do |square, idx|
        return idx if square == dir
        end
    end

    def faster(dir, new_hash)
        new_hash = Hash.new(0)
        dir.each do |d|
            new_hash[d] += 1
        end
        new_hash
    end
end
#trying to push again

