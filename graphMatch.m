function graphMatch()

%reads produced txt files and creates node signatures
[N1, E1, S1] = readGraphFromFile('segment1_graph.txt');
[N2, E2, S2] = readGraphFromFile('segment2_graph.txt');

%calculates cost adjacency matrix and find permutation matrix P
%that defines an optimal match between two graphs
%P: Permutation matrix, C: Adjacency cost matrix
[P,C,match_ratio] = findOptimalMatch(N1,E1,N2,E2,S1,S2);

%draw two segmented region adjacency graph and node-to-node matches
drawMatches(N1,E1,N2,E2,P,C);
    
end