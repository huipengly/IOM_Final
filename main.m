lb = [ones(1,20) 0 0 0 0 0];
ub = [20*ones(1,20) 20 20 20 100 100];
% Aeq = [[zeros(1,23) 1 0];[zeros(1,24) 1]];
% beq = [[zeros(1,23) 29 0];[zeros(1,24) 59]];
IntCon = 1:25;
x=ga(@fitness, 25, [], [], [], [], lb, ub, @nonlcon, IntCon);
