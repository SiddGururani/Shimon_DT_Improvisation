function [sequence] = getSequence(TMat, length, init)

sequence = zeros(1, length);
sequence(1) = init;
for i = 2:length
    sequence(i) = pick_num(TMat(sequence(i-1),:), 1:128);
end

end