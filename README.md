Overview
========

This directory contains empirical investigations in Lua.


Initial Assignment
==================

Sometimes you need to assign multiple values based upon the same condition. Some are fairly simple (e.g. number literals), and some are more complex (e.g. lookups and calculations).

You don't want to repeat the condition:

    local a, b, c, d = test and A or 1, test and B or 2, test and C or 3, test and D or 4

Therefore you only test the condition once:

    local a, b, c, d
    if test then
        a, b, c, d = A, B, C, D
    else
        a, b, c, d = 1, 2, 3, 4
    end

The question is whether it might be faster to perform an initial assignment (that might turn out to have been unnecessary):

    local a, b, c, d = 1, 2, 3, 4
    if test then
        a, b, c, d = A, B, C, D
    end

The investigation reveals that indeed it is about 1/20 faster.
