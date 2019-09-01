module LaTeXChanges


export apply_changes

"""
    apply_changes(input_file, output_file = input_file)

Read the `input_file`, apply the changes from the [LaTeX changes](https://ctan.org/pkg/changes) package and write the result to `output_file`.
"""
function apply_changes(input_file, output_file = input_file)
    str_in = join(readlines(input_file), '\n')
    str_clean = _apply_changes(str_in)
    of = open(output_file, "w")
    write(of, str_clean)
    close(of)
end


function _apply_changes(str)
    @info "Applying \\added{}"
    str = apply_added(str)
    @info "Applying \\deleted{}"
    str = apply_deleted(str)
    @info "Applying \\replaced{}{}"
    str = apply_replaced(str)
end

function apply_added(str)
    newstr = ""

    inds = findfirst(r"\\added", str)

    while inds !== nothing
        i_open = nextind(str, last(inds))
        i_close = closing_index(str, nextind(str, i_open))

        before = str[firstindex(str):prevind(str, first(inds))]
        between = str[nextind(str, i_open):prevind(str, i_close)]
        after = str[nextind(str, i_close):lastindex(str)]

        newstr *= before * between
        str = after

        inds = findfirst(r"\\added", str)
    end

    return newstr * str
end


function apply_deleted(str)
    newstr = ""

    inds = findfirst(r"\\deleted", str)

    while inds !== nothing
        i_open = nextind(str, last(inds))
        i_close = closing_index(str, nextind(str, i_open))

        before = str[firstindex(str):prevind(str, first(inds))]
        after = str[nextind(str, i_close):lastindex(str)]

        newstr *= before
        str = after

        inds = findfirst(r"\\deleted", str)
    end

    return newstr * str
end


function apply_replaced(str)
    newstr = ""

    inds = findfirst(r"\\replaced", str)

    while inds !== nothing
        i_open_add = nextind(str, last(inds))
        i_close_add = closing_index(str, nextind(str, i_open_add))

        i_open_del = nextind(str, i_close_add)
        i_close_del = closing_index(str, nextind(str, i_open_del))

        before = str[firstindex(str):prevind(str, first(inds))]
        between = str[nextind(str, i_open_add):prevind(str, i_close_add)]
        after = str[nextind(str, i_close_del):lastindex(str)]

        newstr *= before * between
        str = after

        inds = findfirst(r"\\replaced", str)
    end

    return newstr * str
end


function closing_index(str, i = firstindex(str))
    n = 0
    lastind = lastindex(str)
    while i <= lastind
        if str[i] == '{'
            n += 1
        elseif str[i] == '}'
            if n == 0
                return i
            else
                n -= 1
            end
        end
        i = nextind(str, i)
    end
    return 0
end


end # module
