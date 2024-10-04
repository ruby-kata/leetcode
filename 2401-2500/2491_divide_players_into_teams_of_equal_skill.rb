# @param {Integer[]} skill
# @return {Integer}
def divide_players(skill)
    skill.sort!

    i = 0
    j = skill.length - 1 
    equal_skill = skill[i] + skill[j]
    chemistry = 0
    while i < j
        return -1 if skill[i] + skill[j] != equal_skill

        chemistry += skill[i] * skill[j]
        i += 1
        j -= 1
    end
    
    chemistry
end
