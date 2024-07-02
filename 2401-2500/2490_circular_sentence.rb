# @param {String} sentence
# @return {Boolean}
def is_circular_sentence(sentence)
    (words = sentence.split(' ')).concat([words.first])
        .each_cons(2)
        .all? { |w1, w2| 
            w1[-1] == w2[0]
        }
end
