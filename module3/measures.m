function [ betw, outCloseness ] = measures( A )
%MEASURES calculatess with the normalised betweenness centrality and 
% closeness centrality measures for all node in the network described by
% adjacency matrix A.
% ##################
% Example:
% ##################
% Inputs:
%
% adj = [0 1 0 0; 0 0 1 0; 1 0 0 1; 0 0 0 0];
% ##################
% Function Calling:
% 
% [ betw, outCloseness ] = measures( A );
% ##################
% Output:
%
% betw =
%     0.1111    0.2222    0.3333         0
% 
% outCloseness =
%     0.5000    0.6000    0.7500         0
% ##################
%  The algorithm was implemented by Daniel Leitold 

%% Node properties
% Closeness
% Observe
if ~exist('closenessCentrality', 'file')
  mfilepath=fileparts(which('measures'));
  addpath(genpath([mfilepath,'\..\module2']));
end

outCloseness = closenessCentrality(A);

% Betweenness
betw = nBetweenness(A);
% All path from s to t except i
all_p=allShortestPaths(A);
all_p(all_p==Inf)=0;

numOfPath = sum(sum(all_p~=0));
betw = betw/numOfPath;

end

