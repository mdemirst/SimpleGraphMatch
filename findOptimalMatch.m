function [P,C,match_ratio] = findOptimalMatch(N1,E1,N2,E2,S1,S2)

tau_m = 0.02;  %cost_thres - node-to-node match threshold in order to be
               %regarded as good match
missing_node_penalty = 0;

C = zeros(size(S1,1),size(S2,1));

for i = 1 : size(S1,1)
    for j = 1 : size(S2,1)
        C(i,j) = calcN2NDistance(S1(i,:),S2(j,:));
    end
end

%solve for permutation matrix
P = Hungarian(C);

nr_good_matches = sum(C(P == 1) < tau_m);
match_ratio = nr_good_matches/(max(size(N1,1),size(N2,1)));

%disp(['Match ratio: ', num2str(match_ratio)]);
% cost metric defined in original paper
%match_ratio = sum(C(find(P)))/min(size(P)) + missing_node_penalty*abs(size(N1,1)-size(N2,1));