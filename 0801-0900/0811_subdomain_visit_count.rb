# @param {String[]} cpdomains
# @return {String[]}
def subdomain_visits(cpdomains)
    counter = Hash.new(0)
    cpdomains.each { |cp|
        count, domain = cp.split(' ')
        count = count.to_i

        i = domain.length
        loop do
            i = domain.rindex('.', i-1)
            break if i.nil?

            counter[domain[i+1..]] += count
        end
        counter[domain] += count
    }

    counter.map { |domain, count|
        "#{count} #{domain}"
    }
end
