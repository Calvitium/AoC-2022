using DelimitedFiles

function day_01_1()
    open("data/1.txt") do 📁
        max_📦 = 0
        current_📦 = 0

        for 🍎 in eachline(📁)
            if 🍎 == ""
                max_📦 = current_📦 > max_📦 ? current_📦 : max_📦
                current_📦 = 0
                continue
            end

            current_📦 += parse(Int, 🍎)
        end

        return max_📦
    end
end


function day_01_2()
    open("data/1.txt") do 📁
        list_📦 = []
        current_📦 = 0

        for 🍎 in eachline(📁)
            if 🍎 == ""
                push!(list_📦, current_📦)
                current_📦 = 0
                continue
            end

            current_📦 += parse(Int, 🍎)
        end

        return sum(sort(list_📦, rev=true)[1:3])
    end
end


function day_02_1()

    📁 = replace(
        readdlm("data/2.txt", Char),
        'A' => '🪨', 'B' => '🧻', 'C' => '✂',
        'X' => '🪨', 'Y' => '🧻', 'Z' => '✂',
    )

    win_map = Dict('🪨' => '🧻', '🧻' => '✂', '✂' => '🪨')
    points = Dict('🪨' => 1, '🧻' => 2, '✂' => 3)
    score = 0

    for (him, me) in zip(📁[:, 1], 📁[:, 2])
        score += points[me]

        if him == me
            score += 3
        elseif me == win_map[him]
            score += 6
        end
    end

    return score
end


function day_02_2()

    📁 = replace(
        readdlm("data/2.txt", Char),
        'A' => '🪨', 'B' => '🧻', 'C' => '✂',
        'X' => '🔴', 'Y' => '🟡', 'Z' => '🟢',
    )

    win_map = Dict('🪨' => '🧻', '🧻' => '✂', '✂' => '🪨')
    loss_map = Dict(value => key for (key, value) in win_map)
    points = Dict('🪨' => 1, '🧻' => 2, '✂' => 3)
    score = 0

    for (him, outcome) in zip(📁[:, 1], 📁[:, 2])
        me = Dict('🔴' => loss_map[him], '🟡' => him, '🟢' => win_map[him])[outcome]
        score += points[me]

        if him == me
            score += 3
        elseif me == win_map[him]
            score += 6
        end
    end

    return score
end


function day_03_1()
    📁 = readdlm("data/3.txt")
    priorities = Dict(char => idx for (idx, char) in enumerate(vcat(collect('a':'z'), collect('A':'Z'))))
    result = 0

    for 📦 in 📁
        half = Int(length(📦) / 2)
        element = first(📦[1:half] ∩ 📦[half+1:end])
        result += priorities[element]
    end

    return result
end


function day_03_2()
    📁 = readdlm("data/3.txt")
    priorities = Dict(char => idx for (idx, char) in enumerate(vcat(collect('a':'z'), collect('A':'Z'))))
    result = 0

    for i in 1:3:length(📁)
        element = first(📁[i] ∩ 📁[i + 1] ∩ 📁[i + 2])
        result += priorities[element]
    end

    return result
end

