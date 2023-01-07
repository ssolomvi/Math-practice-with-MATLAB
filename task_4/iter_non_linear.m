function answer = iter_non_linear(approx, eps, funct)
    prev = approx;
    curr = funct(prev);
    count = 0;

    while ((abs(prev(1) - curr(1)) > eps) || (abs(prev(2) - curr(2)) > eps))
        prev(1) = curr(1);
        prev(2) = curr(2);
        curr = funct(prev);
        count = count + 1;
    end

    answer(1) = curr(1);
    answer(2) = curr(2);
    answer(3) = count;
end
